Return-Path: <linux-kbuild+bounces-9037-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CE2BC21EF
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 18:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 922CB19A4AD4
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 16:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D961D5CFE;
	Tue,  7 Oct 2025 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSMec3oz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A84620330;
	Tue,  7 Oct 2025 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759854823; cv=none; b=o9c2Pf94PYrqupXHTOCkZuuGtCVybJMTQuSu84LcMxjwEG2tuPUVKap/dfgZ7ye2euFiFEBnPt22lh2z0yEuXMlvdTSCrj07fsKTHVy3tc4p3MY3NFVTl0mPlTXqqNbgcygQUrGpCb+vOhOJigWQxUgFkwdA4ZWMHv5CNnfFaB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759854823; c=relaxed/simple;
	bh=VN54zPKLI2MHdbTSCWhsSduLowzk3XRohgM7CNgIEfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNAFIaSjN1WNsOCM7+O1I0Jv3YZxSlP3pkiZMeI9Cmr0lKir26W7U68BS5abcG2T0TufiKnaQy2SeEwK+LlzNEz4XIdJflkO8JAhY8Nguva0+fSRGP5TMH1ZwtFsGEIyWH47gsPv1Y5kb52waZy4Fms7PO0rTUDfEI72SWWieZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSMec3oz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A3BC4CEF1;
	Tue,  7 Oct 2025 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759854822;
	bh=VN54zPKLI2MHdbTSCWhsSduLowzk3XRohgM7CNgIEfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSMec3ozHe9sgjzGWidYitfCzInPw3rVjD/Wi2F6REfKY7WEYkX/gN1ylPPm09h/G
	 R6ZCYO6fBeBDe5C+0cYKC9W8Btrg5N8vciiwssA2N3nQJ4ZJrsyKi+dR4eA6u4gnxh
	 vfU6RCpORPAX29U3cM9MBwxsXWDfPBIQMUNo5HFwSbpHEJYS8rgk2je1MjS9BzVZ2T
	 25AWSk9iBGF+r8PqzUZj8X2CTEZLbK4IYM9ngeY+BUzJrO07vjQMJUvC9dYXQqN5jo
	 wGHiKSAOWkSJhgv7zIv8ug7wum55IArYyALC/VEktnjcwPhvKt/I86FaXQW6JbSL2G
	 L/HvZTRtfrqvw==
Date: Tue, 7 Oct 2025 09:33:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Pat Somaru <patso@likewhatevs.io>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	llvm@lists.linux.dev
Subject: Re: [PATCH] scripts/clang-tools: Handle included .c files in
 gen_compile_commands
Message-ID: <20251007163338.GA547361@ax162>
References: <20251007024527.1439747-1-patso@likewhatevs.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007024527.1439747-1-patso@likewhatevs.io>

Hi Pat,

+ Nicolas and other LLVM folks

On Mon, Oct 06, 2025 at 10:45:27PM -0400, Pat Somaru wrote:
> The gen_compile_commands.py script currently only creates entries for the
> primary source files found in .cmd files, but some kernel source files
> text-include others (i.e. kernel/sched/build_policy.c).
> 
> This prevents tools like clangd from working properly on text-included c
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

I will try to review this more in-depth after the merge window is over,
as Nicolas will be handling applying patches for the 6.19 cycle.
However, my initial gut reaction is that I do not like this additional
complexity. I do see a number of files that include .c files so it may
be worth supporting this still but it feels like this heuristic could be
fragile, especially since aside from clangd, we have no real way to
validate that these files actually build correctly in the way that
compile_commands.json describes.

> ---
>  scripts/clang-tools/gen_compile_commands.py | 126 +++++++++++++++++++-
>  1 file changed, 121 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 96e6e46ad1a70..02791efdc06d0 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -149,8 +149,87 @@ def cmdfiles_for_modorder(modorder):
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
> +                match = re.match(r'^\s*#\s*include\s*[<"]([^>"]*)[>"]', line)
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
> +                match = re.match(r'^\s*#\s*include\s*"([^"]*\.c)"\s*$', line)
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
> @@ -160,7 +239,8 @@ def process_line(root_directory, command_prefix, file_path):
>              Usually relative to root_directory, but sometimes absolute.
>  
>      Returns:
> -        An entry to append to compile_commands.
> +        A list of entries to append to compile_commands (may include multiple
> +        entries if the source file includes other .c files).
>  
>      Raises:
>          ValueError: Could not find the extracted file based on file_path and
> @@ -176,11 +256,47 @@ def process_line(root_directory, command_prefix, file_path):
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
> @@ -213,9 +329,9 @@ def main():
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

