Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D07E242290
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Aug 2020 00:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgHKWjo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Aug 2020 18:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgHKWjn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Aug 2020 18:39:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1E7C06174A
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Aug 2020 15:39:43 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f10so206475plj.8
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Aug 2020 15:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9viru1k3x0Xn7DaGxZZOLfMg9oOC92LLOqtckdZNZWY=;
        b=mUXOZ2ZjlsNTMoqO7Ow8Px6S0/uEYSOHjvc60YBhgwttdYqhtx0sFIsYHAx5uK6ILT
         C1LgiYS4wd7UhoAN1CdSyzlBL5xb9f6GElsixAjpHJDsPH0wznViLK0TCHAqXJ9DJbUt
         VPxDpBiFn84pYsqDB6vyiJ/TQuBZKz7KGtlQlu62PMP5E74N7ktp2d0gMgVi9p1xUWym
         Ge9axoSGYcw7TG2yoRZshtoQUHLqX3HfDqdkfOLYxnvM3Bn8qgXcLaKXwPNmEJEDZJAf
         JSsMCIB9XYvX9DJdP7cBOGWe1zhjNe4yBKO0OvFTYhJ7XCwvlyzKU1ybiRehZxbBZSl4
         hJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9viru1k3x0Xn7DaGxZZOLfMg9oOC92LLOqtckdZNZWY=;
        b=caMvDdesYdb70q1hDO4fjKlzTGHFzyqqHgWhe1W7npeVNOae4lLvWYPBq32SrNRss1
         2TXLExk/MdLBazFLEuzj8HGuw9qkiO/8QiQW82WWXTXa/vZwVov+IXARzJLM5FhcPb1Q
         9BpUXYhNJuMXMQJGouXm2YdVAw9gbD8IASt4kuWzvaJMcKwcWKuUpnrN+WFFDlTS4JSJ
         1N13GR53JbpPI472TvhHO3FA0b2O66dvcafA+a+pHj43exEi1B5M/cX8ttRiW7Yde9RF
         nxTjKysq/LmQfFWVf+jBOVewd+aT89F3vQTAo2+OHked2dfwF9u3s0BYwdwfB/cQfuoD
         5ujQ==
X-Gm-Message-State: AOAM5306fIucOmEuQ01Y25gZEoExiaEwGwZekl/5mbM/cJTsXcaTgLgV
        h7LLHM6TypKnu0fgqYP9Xiq5/g==
X-Google-Smtp-Source: ABdhPJzFMpFYeo7JUndMQWCpJ6udzXMr1+aj/61hWf7dkTnXcZvI+Jzt+6KOvGtQrs5nunZZ6TxRsg==
X-Received: by 2002:a17:90a:fa92:: with SMTP id cu18mr3136405pjb.215.1597185582840;
        Tue, 11 Aug 2020 15:39:42 -0700 (PDT)
Received: from google.com ([2620:0:1008:1101:7220:84ff:fe09:dc21])
        by smtp.gmail.com with ESMTPSA id a4sm30029pju.49.2020.08.11.15.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 15:39:42 -0700 (PDT)
Date:   Tue, 11 Aug 2020 15:39:38 -0700
From:   Tom Roeder <tmroeder@google.com>
To:     Peter Kalauskas <peskal@google.com>
Cc:     linux-kernel@vger.kernel.org, mka@chromium.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] gen_compile_commands: Add support for separate kbuild
 output directory
Message-ID: <20200811223938.GA2475077@google.com>
References: <20200731212141.3709716-1-peskal@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200731212141.3709716-1-peskal@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Adding the kbuild mailing list on CC, which owns this directory.

On Fri, Jul 31, 2020 at 02:21:41PM -0700, Peter Kalauskas wrote:
>Add support for builds that use an output directory different than the
>kernel source tree (e.g. make O=/tmp/kernel-obj). This also introduces
>support for .cmd files that use absolute paths.
>
>Previously, gen_compile_commands.py only supported builds where the
>kernel source tree and the output directory were the same:
> $ make defconfig
> $ make -j32
> $ ./scripts/gen_compile_commands.py
>
>gen_compile_commands.py had flags to support out of tree use, but the
>generated compile_commands.json file still assumed that the source tree
>and kbuild output directory were the same.
>
>Now, the following cases are supported as well:
>
> - Absolute output path:
>   $ mkdir /tmp/kernel-obj
>   $ make O=/tmp/kernel-obj defconfig
>   $ make O=/tmp/kernel-obj -j32
>   $ ./scripts/gen_compile_commands.py -k /tmp/kernel-obj
>
> - Relative output path:
>   $ mkdir kernel-obj
>   $ make O=kernel-obj/ defconfig
>   $ make O=kernel-obj/ -j32
>   $ ./scripts/gen_compile_commands.py -k kernel-obj
>
>The new argument, -k, is introduced in a way that makes the script
>backward compatible with how -d was previously used.
>
>Signed-off-by: Peter Kalauskas <peskal@google.com>
>---
> scripts/gen_compile_commands.py | 112 ++++++++++++++++++++++----------
> 1 file changed, 77 insertions(+), 35 deletions(-)
>
>diff --git scripts/gen_compile_commands.py scripts/gen_compile_commands.py
>index c458696ef3a7..cd3b80bd1942 100755
>--- scripts/gen_compile_commands.py
>+++ scripts/gen_compile_commands.py
>@@ -31,16 +31,24 @@ def parse_arguments():
>
>     Returns:
>         log_level: A logging level to filter log output.
>-        directory: The directory to search for .cmd files.
>+        source_directory: The directory of the kernel source tree.
>+        kbuild_output_directory: The directory to search for .cmd files.
>         output: Where to write the compile-commands JSON file.
>     """
>     usage = 'Creates a compile_commands.json database from kernel .cmd files'
>     parser = argparse.ArgumentParser(description=usage)
>
>-    directory_help = ('Path to the kernel source directory to search '
>+    directory_help = ('Path to the kernel source directory '
>                       '(defaults to the working directory)')
>     parser.add_argument('-d', '--directory', type=str, help=directory_help)
>
>+    kbuild_output_directory_help = (
>+        'Path to the kernel output directory to search for .cmd files '
>+        '(defaults to match --directory)')
>+    parser.add_argument(
>+        '-k', '--kbuild-output-directory', type=str,
>+        help=kbuild_output_directory_help)
>+
>     output_help = ('The location to write compile_commands.json (defaults to '
>                    'compile_commands.json in the search directory)')
Now that there are two directory options, I think the text here should 
match the name of the option more closely. How about "defaults to 
compile_commands.json in --kbuild-output-directory"?

>     parser.add_argument('-o', '--output', type=str, help=output_help)
>@@ -58,58 +66,91 @@ def parse_arguments():
>     if log_level not in _VALID_LOG_LEVELS:
>         raise ValueError('%s is not a valid log level' % log_level)
>
>-    directory = args.directory or os.getcwd()
>-    output = args.output or os.path.join(directory, _DEFAULT_OUTPUT)
>-    directory = os.path.abspath(directory)
>+    source_directory = args.directory or os.getcwd()
>+    kbuild_output_directory = args.kbuild_output_directory or source_directory
>+    output = args.output or os.path.join(source_directory, _DEFAULT_OUTPUT)
I'm not as familiar with out-of-tree options for compile_commands.json; 
should the default be in the source tree or should it be in the object 
tree? I assumed in my previous comment that the right place by default 
was the object tree, but this line suggests that the default will be the 
source tree if the two differ.

>+    source_directory = os.path.abspath(source_directory)
>+    kbuild_output_directory = os.path.abspath(kbuild_output_directory)
>
>-    return log_level, directory, output
>+    return log_level, source_directory, kbuild_output_directory, output
>
>
>-def process_line(root_directory, file_directory, command_prefix, relative_path):
>+def process_line(src_dir, kbuild_out_dir, file_dir, cmd_prefix, file_path):
>     """Extracts information from a .cmd line and creates an entry from it.
>
>     Args:
>-        root_directory: The directory that was searched for .cmd files. Usually
>+        src_dir: The directory of the kernel source tree.
>+        kbuild_out_dir: The directory that was searched for .cmd files. Usually
>             used directly in the "directory" entry in compile_commands.json.
>-        file_directory: The path to the directory the .cmd file was found in.
>-        command_prefix: The extracted command line, up to the last element.
>-        relative_path: The .c file from the end of the extracted command.
>-            Usually relative to root_directory, but sometimes relative to
>-            file_directory and sometimes neither.
>+        file_dir: The path to the directory the .cmd file was found in.
>+        cmd_prefix: The extracted command line, up to the last element.
>+        file_path: The .c file from the end of the extracted command.
>+            Usually relative to kbuild_out_dir, but sometimes relative to
>+            src_dir and sometimes neither.
>
>     Returns:
>         An entry to append to compile_commands.
>
>     Raises:
>-        ValueError: Could not find the extracted file based on relative_path and
>-            root_directory or file_directory.
>+        ValueError: Could not find the extracted file.
>     """
>     # The .cmd files are intended to be included directly by Make, so they
>     # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
>-    # kernel version). The compile_commands.json file is not interepreted
>+    # kernel version). The compile_commands.json file is not interpreted
>     # by Make, so this code replaces the escaped version with '#'.
>-    prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
>-
>-    cur_dir = root_directory
>-    expected_path = os.path.join(cur_dir, relative_path)
>-    if not os.path.exists(expected_path):
>-        # Try using file_directory instead. Some of the tools have a different
>-        # style of .cmd file than the kernel.
>-        cur_dir = file_directory
>-        expected_path = os.path.join(cur_dir, relative_path)
>+    prefix = cmd_prefix.replace('\#', '#').replace('$(pound)', '#')
>+
>+    # Compile commands are usually run in the top level of the kbuild output
>+    # directory
nit: for consistency with the rest of the comments in this file, please 
add punctuation to the end of this sentence and subsequent ones.

>+    working_dir = kbuild_out_dir
>+
>+    if os.path.isabs(file_path):
>+        # This is the most common case when the kbuild output directory is
>+        # outside the kernel source tree (e.g. cd src/linux;
>+        # make O=/tmp/kernel-obj). In this case, the command is run in
>+        # kbuild_out_dir, and file_path is an absolute path to the file being
>+        # compiled.
>+        if not os.path.exists(file_path):
>+            raise ValueError('File %s does not exist' % file_path)
>+    else:
>+        # Otherwise, try to locate the file using its relative path.
>+        #
>+        # First, check for the file relative to kbuild_out_dir. This is the most
>+        # common case when output directory is the same as the kernel source
>+        # directory, or if the output directory is specified using a relative
>+        # path (e.g. make, or make O=kernel-obj/)
>+        expected_path = os.path.join(kbuild_out_dir, file_path)
>+
>         if not os.path.exists(expected_path):
>-            raise ValueError('File %s not in %s or %s' %
>-                             (relative_path, root_directory, file_directory))
>+            # Try using file_dir instead. Some of the tools have a different
>+            # style of .cmd file than the kernel. In this case, the command is
>+            # run in a subdirectory of the kernel source tree. The subdirectory
>+            # will match the directory the cmd file was found in (e.g.
>+            # /tmp/kernel-obj/tools/objtool/.weak.o.cmd contains a command
>+            # that's run in src/linux/tools/objtool/)
>+
>+            # Translate file_dir to a relative path, and use the relative path
>+            # to locate where in the kernel source tree the command may have
>+            # been executed.
>+            relative_file_dir = os.path.relpath(file_dir, kbuild_out_dir)
>+            working_dir = os.path.join(src_dir, relative_file_dir)
>+            expected_path = os.path.join(working_dir, file_path)
>+
>+            if not os.path.exists(expected_path):
>+                # At this point, failures are often from tools/objtool/
>+                # and tools/lib/subcmd/
>+                raise ValueError('File %s not in %s or %s' %
>+                                 (file_path, kbuild_out_dir, file_dir))
>     return {
>-        'directory': cur_dir,
>-        'file': relative_path,
>-        'command': prefix + relative_path,
>+        'directory': working_dir,
>+        'file': file_path,
>+        'command': prefix + file_path,
>     }
>
>
> def main():
>     """Walks through the directory and finds and parses .cmd files."""
>-    log_level, directory, output = parse_arguments()
>+    log_level, src_dir, kbuild_out_dir, out_file = parse_arguments()
>
>     level = getattr(logging, log_level)
>     logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
>@@ -118,7 +159,7 @@ def main():
>     line_matcher = re.compile(_LINE_PATTERN)
>
>     compile_commands = []
>-    for dirpath, _, filenames in os.walk(directory):
>+    for dirpath, _, filenames in os.walk(kbuild_out_dir):
>         for filename in filenames:
>             if not filename_matcher.match(filename):
>                 continue
>@@ -131,14 +172,15 @@ def main():
>                         continue
>
>                     try:
>-                        entry = process_line(directory, dirpath,
>-                                             result.group(1), result.group(2))
>+                        entry = process_line(src_dir, kbuild_out_dir,
>+                                             dirpath, result.group(1),
>+                                             result.group(2))
>                         compile_commands.append(entry)
>                     except ValueError as err:
>                         logging.info('Could not add line from %s: %s',
>                                      filepath, err)
>
>-    with open(output, 'wt') as f:
>+    with open(out_file, 'wt') as f:
>         json.dump(compile_commands, f, indent=2, sort_keys=True)
>
>     count = len(compile_commands)
>-- 
>2.28.0.163.g6104cc2f0b6-goog
>
