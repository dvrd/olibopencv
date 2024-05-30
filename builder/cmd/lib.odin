package cmd

import "base:runtime"
import "core:c"
import "core:c/libc"
import "core:fmt"
import "core:os"
import "core:path/filepath"
import "core:strings"
import "core:testing"

when ODIN_OS == .Darwin {
	foreign import lib "system:System.framework"
} else when ODIN_OS == .Linux {
	foreign import lib "system:c"
}

foreign lib {
	@(link_name = "execvp")
	_unix_execvp :: proc(path: cstring, argv: [^]cstring) -> c.int ---
	@(link_name = "fork")
	_unix_fork :: proc() -> pid_t ---
	@(link_name = "popen")
	_unix_popen :: proc(command: cstring, mode: cstring) -> ^libc.FILE ---
	@(link_name = "pclose")
	_unix_pclose :: proc(stream: ^libc.FILE) -> c.int ---
	@(link_name = "wait")
	_unix_wait :: proc(stat_loc: ^c.int) -> pid_t ---
	@(link_name = "waitpid")
	_unix_waitpid :: proc(pid: pid_t, stat_loc: ^c.int, options: c.int) -> pid_t ---
}

Errno :: enum {
	ERROR_NONE      = 0,
	EPERM           = 1, /* Operation not permitted */
	ENOENT          = 2, /* No such file or directory */
	ESRCH           = 3, /* No such process */
	EINTR           = 4, /* Interrupted system call */
	EIO             = 5, /* Input/output error */
	ENXIO           = 6, /* Device not configured */
	E2BIG           = 7, /* Argument list too long */
	ENOEXEC         = 8, /* Exec format error */
	EBADF           = 9, /* Bad file descriptor */
	ECHILD          = 10, /* No child processes */
	EDEADLK         = 11, /* Resource deadlock avoided */
	ENOMEM          = 12, /* Cannot allocate memory */
	EACCES          = 13, /* Permission denied */
	EFAULT          = 14, /* Bad address */
	ENOTBLK         = 15, /* Block device required */
	EBUSY           = 16, /* Device / Resource busy */
	EEXIST          = 17, /* File exists */
	EXDEV           = 18, /* Cross-device link */
	ENODEV          = 19, /* Operation not supported by device */
	ENOTDIR         = 20, /* Not a directory */
	EISDIR          = 21, /* Is a directory */
	EINVAL          = 22, /* Invalid argument */
	ENFILE          = 23, /* Too many open files in system */
	EMFILE          = 24, /* Too many open files */
	ENOTTY          = 25, /* Inappropriate ioctl for device */
	ETXTBSY         = 26, /* Text file busy */
	EFBIG           = 27, /* File too large */
	ENOSPC          = 28, /* No space left on device */
	ESPIPE          = 29, /* Illegal seek */
	EROFS           = 30, /* Read-only file system */
	EMLINK          = 31, /* Too many links */
	EPIPE           = 32, /* Broken pipe */

	/* math software */
	EDOM            = 33, /* Numerical argument out of domain */
	ERANGE          = 34, /* Result too large */

	/* non-blocking and interrupt i/o */
	EAGAIN          = 35, /* Resource temporarily unavailable */
	EWOULDBLOCK     = EAGAIN, /* Operation would block */
	EINPROGRESS     = 36, /* Operation now in progress */
	EALREADY        = 37, /* Operation already in progress */

	/* ipc/network software -- argument errors */
	ENOTSOCK        = 38, /* Socket operation on non-socket */
	EDESTADDRREQ    = 39, /* Destination address required */
	EMSGSIZE        = 40, /* Message too long */
	EPROTOTYPE      = 41, /* Protocol wrong type for socket */
	ENOPROTOOPT     = 42, /* Protocol not available */
	EPROTONOSUPPORT = 43, /* Protocol not supported */
	ESOCKTNOSUPPORT = 44, /* Socket type not supported */
	ENOTSUP         = 45, /* Operation not supported */
	EOPNOTSUPP      = ENOTSUP,
	EPFNOSUPPORT    = 46, /* Protocol family not supported */
	EAFNOSUPPORT    = 47, /* Address family not supported by protocol family */
	EADDRINUSE      = 48, /* Address already in use */
	EADDRNOTAVAIL   = 49, /* Can't assign requested address */

	/* ipc/network software -- operational errors */
	ENETDOWN        = 50, /* Network is down */
	ENETUNREACH     = 51, /* Network is unreachable */
	ENETRESET       = 52, /* Network dropped connection on reset */
	ECONNABORTED    = 53, /* Software caused connection abort */
	ECONNRESET      = 54, /* Connection reset by peer */
	ENOBUFS         = 55, /* No buffer space available */
	EISCONN         = 56, /* Socket is already connected */
	ENOTCONN        = 57, /* Socket is not connected */
	ESHUTDOWN       = 58, /* Can't send after socket shutdown */
	ETOOMANYREFS    = 59, /* Too many references: can't splice */
	ETIMEDOUT       = 60, /* Operation timed out */
	ECONNREFUSED    = 61, /* Connection refused */
	ELOOP           = 62, /* Too many levels of symbolic links */
	ENAMETOOLONG    = 63, /* File name too long */

	/* should be rearranged */
	EHOSTDOWN       = 64, /* Host is down */
	EHOSTUNREACH    = 65, /* No route to host */
	ENOTEMPTY       = 66, /* Directory not empty */

	/* quotas & mush */
	EPROCLIM        = 67, /* Too many processes */
	EUSERS          = 68, /* Too many users */
	EDQUOT          = 69, /* Disc quota exceeded */

	/* Network File System */
	ESTALE          = 70, /* Stale NFS file handle */
	EREMOTE         = 71, /* Too many levels of remote in path */
	EBADRPC         = 72, /* RPC struct is bad */
	ERPCMISMATCH    = 73, /* RPC version wrong */
	EPROGUNAVAIL    = 74, /* RPC prog. not avail */
	EPROGMISMATCH   = 75, /* Program version wrong */
	EPROCUNAVAIL    = 76, /* Bad procedure for program */
	ENOLCK          = 77, /* No locks available */
	ENOSYS          = 78, /* Function not implemented */
	EFTYPE          = 79, /* Inappropriate file type or format */
	EAUTH           = 80, /* Authentication error */
	ENEEDAUTH       = 81, /* Need authenticator */

	/* Intelligent device errors */
	EPWROFF         = 82, /* Device power is off */
	EDEVERR         = 83, /* Device error, e.g. paper out */
	EOVERFLOW       = 84, /* Value too large to be stored in data type */

	/* Program loading errors */
	EBADEXEC        = 85, /* Bad executable */
	EBADARCH        = 86, /* Bad CPU type in executable */
	ESHLIBVERS      = 87, /* Shared library version mismatch */
	EBADMACHO       = 88, /* Malformed Macho file */
	ECANCELED       = 89, /* Operation canceled */
	EIDRM           = 90, /* Identifier removed */
	ENOMSG          = 91, /* No message of desired type */
	EILSEQ          = 92, /* Illegal byte sequence */
	ENOATTR         = 93, /* Attribute not found */
	EBADMSG         = 94, /* Bad message */
	EMULTIHOP       = 95, /* Reserved */
	ENODATA         = 96, /* No message available on STREAM */
	ENOLINK         = 97, /* Reserved */
	ENOSR           = 98, /* No STREAM resources */
	ENOSTR          = 99, /* Not a STREAM */
	EPROTO          = 100, /* Protocol error */
	ETIME           = 101, /* STREAM ioctl timeout */
	ENOPOLICY       = 103, /* No such policy registered */
	ENOTRECOVERABLE = 104, /* State not recoverable */
	EOWNERDEAD      = 105, /* Previous owner died */
	EQFULL          = 106, /* Interface output queue is full */
	ELAST           = 106, /* Must be equal largest errno */
}

Pid :: distinct c.int
pid_t :: c.int

/// Termination signal
/// Only retrieve the code if WIFSIGNALED(s) = true
WTERMSIG :: #force_inline proc "contextless" (s: c.int) -> c.int {
	return s & 0x7f
}

/// Check if the process signaled
WIFSIGNALED :: #force_inline proc "contextless" (s: c.int) -> bool {
	return cast(i8)(((s) & 0x7f) + 1) >> 1 > 0
}

/// Check if the process terminated normally (via exit.2)
WIFEXITED :: #force_inline proc "contextless" (s: c.int) -> bool {
	return WTERMSIG(s) == 0
}

WaitOption :: enum {
	WNOHANG     = 0,
	WUNTRACED   = 1,
	WSTOPPED    = WUNTRACED,
	WEXITED     = 2,
	WCONTINUED  = 3,
	WNOWAIT     = 24,
	// For processes created using clone
	__WNOTHREAD = 29,
	__WALL      = 30,
	__WCLONE    = 31,
}

WaitOptions :: bit_set[WaitOption;i32]

CmdRunner :: struct {
	args: []string,
	path: string,
	pid:  Pid,
	err:  Errno,
}

fork :: proc() -> (Pid, Errno) {
	pid := _unix_fork()
	if pid == -1 {
		return -1, Errno(os.get_last_error())
	}
	return Pid(pid), .ERROR_NONE
}

launch :: proc(args: []string) -> Errno {
	r: CmdRunner
	if !init(&r, args) do return r.err
	if !run(&r) do return r.err
	if !wait(&r) do return r.err

	return .ERROR_NONE
}

init :: proc(cmd: ^CmdRunner, args: []string) -> (ok: bool) {
	cmd.args = args
	cmd.pid, cmd.err = fork()
	return cmd.err == .ERROR_NONE
}

run :: proc(cmd: ^CmdRunner) -> bool {
	if (cmd.pid == 0) {
		err := exec(cmd.args)
		return err == .ERROR_NONE
	}
	return true
}

wait :: proc(cmd: ^CmdRunner) -> bool {
	status: c.int
	wpid, err := waitpid(cmd.pid, &status, {.WUNTRACED})
	cmd.err = err
	return wpid == cmd.pid && WIFEXITED(status)
}

exec :: proc(args: []string = {}) -> Errno {
	runtime.DEFAULT_TEMP_ALLOCATOR_TEMP_GUARD()
	path_cstr := strings.clone_to_cstring(args[0])
	args_cstrs := make([]cstring, len(args) + 1, context.temp_allocator)
	for i in 0 ..< len(args) {
		args_cstrs[i] = strings.clone_to_cstring(args[i], context.temp_allocator)
	}

	if _unix_execvp(path_cstr, raw_data(args_cstrs)) < 0 {
		return cast(Errno)os.get_last_error()
	}

	return .ERROR_NONE
}

find_program :: proc(target: string) -> (string, bool) {
	env_path := os.get_env("PATH")
	dirs := strings.split(env_path, ":")

	if len(dirs) == 0 do return "", false

	for dir in dirs {
		if !os.is_dir(dir) do continue

		fd, err := os.open(dir)
		defer os.close(fd)
		if Errno(err) != .ERROR_NONE do continue

		fis: []os.File_Info
		defer os.file_info_slice_delete(fis)
		fis, err = os.read_dir(fd, -1)
		if Errno(err) != .ERROR_NONE do continue

		for fi in fis {
			if fi.name == target do return strings.clone(fi.fullpath), true
		}
	}

	return "", false
}

popen :: proc(cmd: string, get_response := true, read_size := 4096) -> (out: string, ok: bool) {
	cmd_cstr := strings.clone_to_cstring(cmd)
	defer delete(cmd_cstr)
	file := _unix_popen(cmd_cstr, cstring("r"))

	ok = file != nil

	if ok && get_response {
		data := make([]u8, read_size)
		cstr := libc.fgets(cast(^byte)&data[0], i32(read_size), file)
		out = strings.clone_from_cstring(cstring(cstr))
		ok = cstr != nil
	}
	_unix_pclose(file)

	return
}

waitpid :: proc "contextless" (pid: Pid, status: ^c.int, options: WaitOptions) -> (Pid, Errno) {
	ret := _unix_waitpid(cast(i32)pid, cast(^c.int)status, transmute(c.int)options)
	return Pid(ret), Errno(os.get_last_error())
}

@(test)
test_launch :: proc(t: ^testing.T) {
	using testing

	rnr: CmdRunner
	arguments := []string{"echo", "testing"}
	expect(
		t,
		launch(arguments) == .ERROR_NONE,
		fmt.tprint("should be successful, but found error:", rnr.err),
	)
}
