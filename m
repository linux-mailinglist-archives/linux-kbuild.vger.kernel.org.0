Return-Path: <linux-kbuild+bounces-9041-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AB6BC28FB
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 21:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B556B19A0C14
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 19:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3B01DAC95;
	Tue,  7 Oct 2025 19:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P4coBWFd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186B915B971
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Oct 2025 19:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759866909; cv=none; b=tWlM0IgsjwEpUT6e190uavigGonEPZIew/R5DSWHmZNYYUAX7LwPTEUIaP1vcfThmqWDJ42+jwgaIrengQaW/1qcqy1M6KoiJGF65xBNedj6dOBRbHNR8tH2pOW81ZO/4DwSI6Ptj+99PAU9/s1xVXU5Hhohp8XBfmwfu5EEGyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759866909; c=relaxed/simple;
	bh=plSEtvPhY/rIygWqQ8QOMfmFnvVkNWP5JTWh77qSsTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSWrD32Eds+rscXg0eluTplpjibNcEPtx0+ukEMIlyIK2Th7IMf5CRGB1MnijoWNtDQN0UpIhkOs7GipFmR2YJHgaflu47wOnAyDIqo8OM1WUqlualhPQQ76XHqANcSbWHWMYk8/oVjsyQHEAXKbpONB2EtpP5723TwZBzeWkrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P4coBWFd; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-938bf212b72so235833639f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Oct 2025 12:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759866907; x=1760471707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzh5SWMuQ5hQYUug6D8uSMt45Zie+gb0SQfucXV5Huc=;
        b=P4coBWFd9A++Lmdy1vOaxmxUOy88ZTmKBMvWXxjPLjH0pGyiRsABUnL7vEGgec5R9Y
         zH+Kfhnuiy3DzQhM/BNGNDKSO+gf+1fRuc4XFWAIkODiUnKYoJjcOc7wV2HtrjkduTR9
         +cTbCdteR42vwTXxo96An2XiBOiVxNA2+Ds0OW+t+2J10DmKu+kNVAhM+8spAfqlZyZW
         A0+MhwY1FXq0JQZu+cEegSBKUjRRzrqdmGNzuaQSXHMxDhW2B7IareGM4gxzh0U3fjdc
         uP5IuadbvayvhGXOWggmKhWvqow/ttp/sOz5RMaRQZwFiNOhb2XjqA/E259Jmona7ypZ
         M5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759866907; x=1760471707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzh5SWMuQ5hQYUug6D8uSMt45Zie+gb0SQfucXV5Huc=;
        b=Z2bdxDJSGkyMfItgyJ/KMm+rMNoBtTlIDOiPelpVhts7+bpfq1IPh9dVoC0agLq7iz
         CPw3HbHy8yXnbxbuvnOmiLtwJD2eZEeURFcumRWWsilh6XQj6/rJjnErSl6IOU3UqnLe
         KN3hWoRYvC/em5gVsvcRqGSlgi+Kf8eefsrGaaiLZct10LNlo3VjHS+tMg6QiqmcOL7u
         rKPYUqc1AI/ECSrUQ6WxkZ75HHI5tHbrjro7piBO/uedk8zh9mTzrQaFwILkqbQo+hoc
         V8wcyeNrfJNf9nqeebavUz8md5mbQhlv9NJGRjVbV+tOVzUm//xLdbzKVB8PqMhDqwBV
         fEIA==
X-Forwarded-Encrypted: i=1; AJvYcCVC6WTiOjS9RPr/U2yvpkbN2udChFCWgkNg9WzU+Qyf7an+8+XUzdXvcHeIgrZg+ieZSw5hIlrb5mIfwOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYH9B2itFcMfumIx2MnPSQz8UTQxANXNgYlRO2/9To8uuQ88Ve
	d8Ch9yjKrZISDJqSfK3+YQDpRSn38GMOM+bJUbTJfMy6rdSNl5ko3QZ49YCdQFWeIQ==
X-Gm-Gg: ASbGnctSCnx0fRGmlx3rWjhvUw/8ouFY1xRqlaZUxlvJ57zYYYQL4lSXBAuHimwzRpq
	JOjirA9vCdnaLYtdZRivBT4ap05Y/HQ2tU1ePpL9sUcr+bJWfQbuwBZfnQB0tartD4/UhxoKa8Z
	qzUW6+B1HNQY+8lVx59BL7NOckzfaLyo2Yy0ieZLX2VBjuNnM1/yI7BywKYZZpq3uCT7RiBkmLk
	wKKQwk66G3q4HzaRZqgwDajEk4ylqYR/SFVvM+Qe9WaQIZB5RzW0MNNJT4q2LtbdtOcqoSvWuhL
	zujHy8dpDXSgTap8etPCOZq30aAOQNbqwVnFRI+RlHIDJyvaUIhfRxW0m5ekaf7QsFNX5IjzSMN
	ihFzEGg3BdGMVVdQ0BDxciIv25JvbkGiubognSVV5+7BHn5uHFiJSfuqoec+YbuFBhHP6f2yN5P
	whGgXuyXnSEi3wpGWUUeg=
X-Google-Smtp-Source: AGHT+IEt6aF7QZitatG5gN6pkBx/fkgmj32TgXzWk6QwGWuOIFKF21KrP65qWlT0P8wvx0kvvfs4RQ==
X-Received: by 2002:a05:6e02:258b:b0:42f:8320:eec with SMTP id e9e14a558f8ab-42f873df017mr5871175ab.16.1759866906658;
        Tue, 07 Oct 2025 12:55:06 -0700 (PDT)
Received: from google.com (138.243.29.34.bc.googleusercontent.com. [34.29.243.138])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ea31448sm6414736173.29.2025.10.07.12.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:55:06 -0700 (PDT)
Date: Tue, 7 Oct 2025 12:55:03 -0700
From: Justin Stitt <justinstitt@google.com>
To: Pat Somaru <patso@likewhatevs.io>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts/clang-tools: Handle included .c files in
 gen_compile_commands
Message-ID: <be6kxu36uphlnhedsi7gsayhuetmqixil4dv2lxe4plvgyqewx@jecdpummb52l>
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

Hi,

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

FWIW, I tested this out and my clangd was much happier dealing with
kernel/sched/ext.c. Nathan's points are still valid, I'm just giving
user feedback.

After benchmarking the script itself, I saw some performance hits:

pre-patch, 5x run average: 0.590 seconds
post-patch, 5x run average: 2.164 seconds

With this simple invocation:

  ./scripts/clang-tools/gen_compile_commands.py -d build-master -o $TMP/compile_commands.json

I realize this script is not ran often but maybe there is some heurstic
or speedup that can be made to the regex.

Tested-by: Justin Stitt <justinstitt@google.com>

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
>

Thanks
Justin

