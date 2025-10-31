Return-Path: <linux-kbuild+bounces-9342-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1DAC27277
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Oct 2025 23:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C546421292
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Oct 2025 22:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECBC30CD81;
	Fri, 31 Oct 2025 22:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4T+p/21"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4606C4A23;
	Fri, 31 Oct 2025 22:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761951370; cv=none; b=Rg5BXwTD+SBm9wlimUjPavZ3ogVBdK6xKb8qVGBQycxN2JgztPccDjYD7mXZuc46ng4EVfN8YsUIAP1MfnT8crf/q98wfP6g5xuL8dU3K9sDfU3D/S3V556cf31B4hrceqXfbCd6rHHuvtHyUqQw/TYVj/iO71tGZGM2MmE3rr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761951370; c=relaxed/simple;
	bh=gQ4hi5/29vbrRucVGOwpd/belu4/wVdaVbRKmDlxn6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agA/FfFTXyAKh5mJtWzrfom4fF5ZcGrWaa+uAsRicU38YaNSl/5SimjUR2YaIvQvSgFtIT6LAlDHLlRG5KvUC5vzAIu43RsNkeJqTwqCldTYyhX+wW9JzDSkgnwHm69OZbPUNJTTr81S2n6vUh7FKLLqn61yI/tNz37rEUDk9+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4T+p/21; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2735CC4CEE7;
	Fri, 31 Oct 2025 22:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761951369;
	bh=gQ4hi5/29vbrRucVGOwpd/belu4/wVdaVbRKmDlxn6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J4T+p/21eTzWN6Avt+DdSWs1mSbkp4Odi+EAWb5ayH+HjzqgFv6s92whqgzrcLfm7
	 5Gl3SiMMf5lcW4kT3ZDqqL8c0r7KDX8jYmPqRsUtYDDOmhiZF9v4CX8ge1Rq9cMfp4
	 bik5d1Vn9UU8TzoDKUafxzPXgBgRk9Hywihzqyv3MMtESjx7ToddFOeoT2N6X0nQwg
	 +0SF/ucHl0PaBJdC3dGi2tX/p9ER5aoTQAWFFTUeF5RGr0WuiLzC0QCZ66tPRJFULX
	 iax7iH6m3sI1twhF92m62CXSWuIGsvpP86gs2vIY4OKTLdr6YUJsl2VuWu/3i/eK1s
	 2wd9+pLaV6QlQ==
Date: Fri, 31 Oct 2025 18:56:05 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Pat Somaru <patso@likewhatevs.io>
Cc: justinstitt@google.com, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, morbo@google.com,
	nick.desaulniers+lkml@gmail.com, nsc@kernel.org
Subject: Re: [PATCH v2] scripts/clang-tools: Handle included .c files in
 gen_compile_commands
Message-ID: <20251031225605.GA2874962@ax162>
References: <20251008003739.2659141-1-patso@likewhatevs.io>
 <20251008004615.2690081-1-patso@likewhatevs.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008004615.2690081-1-patso@likewhatevs.io>

Hi Pat,

On Tue, Oct 07, 2025 at 08:45:28PM -0400, Pat Somaru wrote:
> The gen_compile_commands.py script currently only creates entries for the
> primary source files found in .cmd files, but some kernel source files
> text-include others (i.e. kernel/sched/build_policy.c).
> 
> This prevents tools like clangd from working properly on text-includedd c
> files, such as kernel/sched/ext.c because the generated compile_commands.json
> does not have entries for them.
> 
> Extend process_line() to detect when a source file includes .c files, and
> generate additional compile_commands.json entries for them. For included c
> files, use the same compile flags as their parent and add their parents headers.
> 
> This enables lsp tools like clangd to work properly on files like
> kernel/sched/ext.c
> 
> Signed-off-by: Pat Somaru <patso@likewhatevs.io>
> Tested-by: Justin Stitt <justinstitt@google.com>

I have taken a look over this and it seems fine to me from a Python
perspective. I trust that you will be around if there are any problems
that crop up in testing but given that this should only impact files
that include .c files, I expect the fallout to be minimal.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Nicolas should be able to pick this up for kbuild-next.

> ---
>  scripts/clang-tools/gen_compile_commands.py | 135 +++++++++++++++++++-
>  1 file changed, 128 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 96e6e46ad1a70..6f4afa92a4665 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -21,6 +21,12 @@ _DEFAULT_LOG_LEVEL = 'WARNING'
>  _FILENAME_PATTERN = r'^\..*\.cmd$'
>  _LINE_PATTERN = r'^(saved)?cmd_[^ ]*\.o := (?P<command_prefix>.* )(?P<file_path>[^ ]*\.[cS]) *(;|$)'
>  _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
> +
> +# Pre-compiled regexes for better performance
> +_INCLUDE_PATTERN = re.compile(r'^\s*#\s*include\s*[<"]([^>"]*)[>"]')
> +_C_INCLUDE_PATTERN = re.compile(r'^\s*#\s*include\s*"([^"]*\.c)"\s*$')
> +_FILENAME_MATCHER = re.compile(_FILENAME_PATTERN)
> +
>  # The tools/ directory adopts a different build system, and produces .cmd
>  # files in a different format. Do not support it.
>  _EXCLUDE_DIRS = ['.git', 'Documentation', 'include', 'tools']
> @@ -82,7 +88,6 @@ def cmdfiles_in_dir(directory):
>          The path to a .cmd file.
>      """
>  
> -    filename_matcher = re.compile(_FILENAME_PATTERN)
>      exclude_dirs = [ os.path.join(directory, d) for d in _EXCLUDE_DIRS ]
>  
>      for dirpath, dirnames, filenames in os.walk(directory, topdown=True):
> @@ -92,7 +97,7 @@ def cmdfiles_in_dir(directory):
>              continue
>  
>          for filename in filenames:
> -            if filename_matcher.match(filename):
> +            if _FILENAME_MATCHER.match(filename):
>                  yield os.path.join(dirpath, filename)
>  
>  
> @@ -149,8 +154,87 @@ def cmdfiles_for_modorder(modorder):
>                      yield to_cmdfile(mod_line.rstrip())
>  
>  
> +def extract_includes_from_file(source_file, root_directory):
> +    """Extract #include statements from a C file.
> +
> +    Args:
> +        source_file: Path to the source .c file to analyze
> +        root_directory: Root directory for resolving relative paths
> +
> +    Returns:
> +        List of header files that should be included (without quotes/brackets)
> +    """
> +    includes = []
> +    if not os.path.exists(source_file):
> +        return includes
> +
> +    try:
> +        with open(source_file, 'r') as f:
> +            for line in f:
> +                line = line.strip()
> +                # Look for #include statements.
> +                # Match both #include "header.h" and #include <header.h>.
> +                match = _INCLUDE_PATTERN.match(line)
> +                if match:
> +                    header = match.group(1)
> +                    # Skip including other .c files to avoid circular includes.
> +                    if not header.endswith('.c'):
> +                        # For relative includes (quoted), resolve path relative to source file.
> +                        if '"' in line:
> +                            src_dir = os.path.dirname(source_file)
> +                            header_path = os.path.join(src_dir, header)
> +                            if os.path.exists(header_path):
> +                                rel_header = os.path.relpath(header_path, root_directory)
> +                                includes.append(rel_header)
> +                            else:
> +                                includes.append(header)
> +                        else:
> +                            # System include like <linux/sched.h>.
> +                            includes.append(header)
> +    except IOError:
> +        pass
> +
> +    return includes
> +
> +
> +def find_included_c_files(source_file, root_directory):
> +    """Find .c files that are included by the given source file.
> +
> +    Args:
> +        source_file: Path to the source .c file
> +        root_directory: Root directory for resolving relative paths
> +
> +    Yields:
> +        Full paths to included .c files
> +    """
> +    if not os.path.exists(source_file):
> +        return
> +
> +    try:
> +        with open(source_file, 'r') as f:
> +            for line in f:
> +                line = line.strip()
> +                # Look for #include "*.c" patterns.
> +                match = _C_INCLUDE_PATTERN.match(line)
> +                if match:
> +                    included_file = match.group(1)
> +                    # Handle relative paths.
> +                    if not os.path.isabs(included_file):
> +                        src_dir = os.path.dirname(source_file)
> +                        included_file = os.path.join(src_dir, included_file)
> +
> +                    # Normalize the path.
> +                    included_file = os.path.normpath(included_file)
> +
> +                    # Check if the file exists.
> +                    if os.path.exists(included_file):
> +                        yield included_file
> +    except IOError:
> +        pass
> +
> +
>  def process_line(root_directory, command_prefix, file_path):
> -    """Extracts information from a .cmd line and creates an entry from it.
> +    """Extracts information from a .cmd line and creates entries from it.
>  
>      Args:
>          root_directory: The directory that was searched for .cmd files. Usually
> @@ -160,7 +244,8 @@ def process_line(root_directory, command_prefix, file_path):
>              Usually relative to root_directory, but sometimes absolute.
>  
>      Returns:
> -        An entry to append to compile_commands.
> +        A list of entries to append to compile_commands (may include multiple
> +        entries if the source file includes other .c files).
>  
>      Raises:
>          ValueError: Could not find the extracted file based on file_path and
> @@ -176,11 +261,47 @@ def process_line(root_directory, command_prefix, file_path):
>      abs_path = os.path.realpath(os.path.join(root_directory, file_path))
>      if not os.path.exists(abs_path):
>          raise ValueError('File %s not found' % abs_path)
> -    return {
> +
> +    entries = []
> +
> +    # Create entry for the main source file.
> +    main_entry = {
>          'directory': root_directory,
>          'file': abs_path,
>          'command': prefix + file_path,
>      }
> +    entries.append(main_entry)
> +
> +    # Find and create entries for included .c files.
> +    for included_c_file in find_included_c_files(abs_path, root_directory):
> +        # For included .c files, create a compilation command that:
> +        # 1. Uses the same compilation flags as the parent file
> +        # 2. But compiles the included file directly (not the parent)
> +        # 3. Includes necessary headers from the parent file for proper macro resolution
> +
> +        # Convert absolute path to relative for the command.
> +        rel_path = os.path.relpath(included_c_file, root_directory)
> +
> +        # Extract includes from the parent file to provide proper compilation context.
> +        extra_includes = ''
> +        try:
> +            parent_includes = extract_includes_from_file(abs_path, root_directory)
> +            if parent_includes:
> +                extra_includes = ' ' + ' '.join('-include ' + inc for inc in parent_includes)
> +        except IOError:
> +            pass
> +
> +        included_entry = {
> +            'directory': root_directory,
> +            'file': included_c_file,
> +            # Use the same compilation prefix but target the included file directly.
> +            # Add extra headers for proper macro resolution.
> +            'command': prefix + extra_includes + ' ' + rel_path,
> +        }
> +        entries.append(included_entry)
> +        logging.debug('Added entry for included file: %s', included_c_file)
> +
> +    return entries
>  
>  
>  def main():
> @@ -213,9 +334,9 @@ def main():
>                  result = line_matcher.match(f.readline())
>                  if result:
>                      try:
> -                        entry = process_line(directory, result.group('command_prefix'),
> +                        entries = process_line(directory, result.group('command_prefix'),
>                                               result.group('file_path'))
> -                        compile_commands.append(entry)
> +                        compile_commands.extend(entries)
>                      except ValueError as err:
>                          logging.info('Could not add line from %s: %s',
>                                       cmdfile, err)
> -- 
> 2.51.0
> 

