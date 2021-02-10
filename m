Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5FE331716E
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Feb 2021 21:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbhBJUdC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Feb 2021 15:33:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbhBJUdA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Feb 2021 15:33:00 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C52C06174A
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Feb 2021 12:32:20 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id l18so1848173pji.3
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Feb 2021 12:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aMO6X6G0WH01pbGLV0S28D1NOm/hEWB/uR+Vm5pjbWc=;
        b=hwzcB+gVAWOdO2CmIB2swY8SHOzlAOVKeajgqLwZoR6LeTCIOYAcWJ193Qn+ojg6gp
         DFVbiNOx3qmy3WYJjfz9WCSjsqfU0dqSvaEONA+WA2E8gw5BgbPWqZCnEkVqHf+vrzCX
         F0XUdffRg6S6CIWUxkHsnCYuBn5ml8if7c3WdMhIIxtAkL58aGfFmZ5QTvfu0o4d2y9l
         iKLdsp3W58frBnfU7b0paxvtgeY2bHWEveT9hQrOrzFTt+7emApKRFEnEIBqS1J/OTAC
         MjA5cFZlkF9W8TBDSpWgeWHN71mOLgQyhFCYlCR82hi+d8xPT8v1orqpqm5a4COHbiIg
         XSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aMO6X6G0WH01pbGLV0S28D1NOm/hEWB/uR+Vm5pjbWc=;
        b=Rk6tAdLzj4F/B5MzwYoCXMMrvncH5x1K8WlDp3n+JwItWo5+WZdhRKGuWoP1+0c8rs
         zBj80dfQr2Us1OXbgVWazCeqJomxnnMklCM4/cBF5PHnIWVOLRyB+1/ncaQokSbRby5/
         xCc9648ATRnGj8RURXG6XwirEz2BA2Vb1fHqrGGlTSu1GPYGckPGxxswIPqagrlTc2O6
         8i9p4Q9P3aZJioy4EqYCDgAKjrWwK4lFrpYJhK0+Z19Z7F3e7SNmyUJnzY9HtStYKs5N
         BrikEQLwYFR/q2/g9VjZHRaYVtONdS4Ps8X/UWeZb0BfPt9iIa/GJ2DQQt51Th5WJYig
         iJxg==
X-Gm-Message-State: AOAM531cQmtYa6ppk+rbm4lhiXw2Sbz7Kv7z3esfROGVCmkKDWf2bHh3
        D/tNFWbeQIdBISg+BKYDDp+tdw==
X-Google-Smtp-Source: ABdhPJxPtEqUukNMC7ygS733ldLrS2ng5Nv5CIj61/wtFGcAgcwDtQFWM67/9mNGPDR9jNsEBIQRlA==
X-Received: by 2002:a17:902:b10b:b029:e3:103c:4c47 with SMTP id q11-20020a170902b10bb02900e3103c4c47mr513320plr.8.1612989139962;
        Wed, 10 Feb 2021 12:32:19 -0800 (PST)
Received: from google.com ([2620:0:1008:11:6100:9d9:528c:3c92])
        by smtp.gmail.com with ESMTPSA id c188sm3197601pfa.98.2021.02.10.12.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:32:18 -0800 (PST)
Date:   Wed, 10 Feb 2021 12:32:14 -0800
From:   Tom Roeder <tmroeder@google.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Stephen Zhang <stephenzhangzsd@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        natechancellor@gmail.com, clang-built-linux@googlegroups.com,
        LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v1] clang_tools:gen_compile_commands: Change the default
 source directory
Message-ID: <YCRCztmDvm22iWou@google.com>
References: <1612783737-3512-1-git-send-email-stephenzhangzsd@gmail.com>
 <20210208195439.GA1097868@ubuntu-m3-large-x86>
 <CALuz2=d-ENRbWgGYaO_ESEaw5eOVSwkQmkeYBJ-w0Vb3zZ+REg@mail.gmail.com>
 <20210209192729.GA820978@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210209192729.GA820978@ubuntu-m3-large-x86>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 09, 2021 at 12:27:29PM -0700, Nathan Chancellor wrote:
>On Tue, Feb 09, 2021 at 09:56:20PM +0800, Stephen Zhang wrote:
>> Nathan Chancellor <nathan@kernel.org> 于2021年2月9日周二 上午3:54写道：
>>
>> > On Mon, Feb 08, 2021 at 07:28:57PM +0800, Stephen Zhang wrote:
>> > > The default source directory is set equal to build directory which
>> > > specified by "-d".But it is designed to be set to the current working
>> > > directoy by default, as the help messge says.It makes a differece when
>> > > source directory and build directory are in separted directorys.
>> > >
>> > > Signed-off-by: Stephen Zhang <stephenzhangzsd@gmail.com>
>> >
>> > I don't think this patch makes much sense unless I am misunderstanding
>> > the description of the problem. The entire point of this script is to
>> > parse the .cmd files that kbuild generates and those are only present
>> > in the build directory, not the source directory, so we should never be
>> > looking in there, unless args.directory is its default value, which is
>> > the way the script is currently written. Your patch would appear to
>> > either make use do way more searching than necessary (if the build
>> > folder is within the source folder) or miss it altogether (if the build
>> > folder is outside the source folder).
>> >
>> > Cheers,
>> > Nathan
>
>Just as an FYI, your email was HTML, which means it won't hit LKML.
>
>> Specifically,the souce directory is  /vm/linux/tools/perf on my machine,
>> while the build
>> directory is /vm/tmpbuild/tools/perf .In the build directory , Execute the
>> command:
>>
>> /vm/linux/scripts/clang-tools/gen_compile_commands.py --log_level DEBUG -d .
>>
>> The resulting debugging message is:
>>
>>     INFO: Could not add line from /vm/tmpbuild/tools/perf/.perf.o.cmd: File
>> /vm/tmpbuild/tools/perf/perf.c
>>     not found.
>>
>> But actually what we want is ：
>>
>>     add line from /vm/tmpbuild/tools/perf/.perf.o.cmd: File
>> /vm/linux/tools/perf/perf.c.
>>
>> The    " /vm/tmpbuild/tools/perf " of  the "File
>> /vm/tmpbuild/tools/perf/perf.c not found." is passed by  "-d".
>>
>> so it is the "-d" which decides the source prefix.
>>
>> Then we execute:
>>
>>  /vm/linux/scripts/clang-tools/gen_compile_commands.py --log_level DEBUG
>> -d  /vm/linux/tools/perf
>>
>> But in the oringnal code , the default build directory is the same as  the
>> source directory:
>>
>> @@ -64,7 +64,7 @@ def parse_arguments():
>>              os.path.abspath(args.directory),
>>              args.output,
>>              args.ar,
>> -            args.paths if len(args.paths) > 0 else [args.directory])
>> +            args.paths if len(args.paths) > 0 else [os.getcwd()])
>>
>> after changing  it ,we then get the right result.
>
>Okay I think I see what is going on here. Your patch does not actually
>fix the problem from what I can tell though:
>
>$ mkdir -p /tmp/build/perf
>
>$ make -C tools/perf -skj"$(nproc)" O=/tmp/build/perf
>
>$ cd /tmp/build/perf
>
>$ ~/cbl/src/linux/scripts/clang-tools/gen_compile_commands.py --log_level INFO -d .
>...
>INFO: Could not add line from /tmp/build/perf/arch/x86/tests/.bp-modify.o.cmd: File /tmp/build/perf/arch/x86/tests/bp-modify.c not found
>INFO: Could not add line from /tmp/build/perf/arch/x86/tests/.insn-x86.o.cmd: File /tmp/build/perf/arch/x86/tests/insn-x86.c not found
>INFO: Could not add line from /tmp/build/perf/arch/x86/tests/.arch-tests.o.cmd: File /tmp/build/perf/arch/x86/tests/arch-tests.c not found
>INFO: Could not add line from /tmp/build/perf/arch/x86/tests/.intel-pt-pkt-decoder-test.o.cmd: File /tmp/build/perf/arch/x86/tests/intel-pt-pkt-decoder-test.c not found
>...
>
>The script has to know where the source location is in your particular
>use case because the .cmd files do not record it (maybe some future
>improvement?)
>
>This patch appears to generate what I think the compile_commands.json
>should look like for the most part, I am not sure if this is proper or
>works correctly though. CC'ing Tom Roeder who originally wrote this.
>Tom, the initial patch and description of the issue is here:
>https://lore.kernel.org/r/1612783737-3512-1-git-send-email-stephenzhangzsd@gmail.com/

Thanks! I'll take a look. I'm also CC'ing linux-kbuild, which is the 
subtree that owns the script; I haven't been very involved since I added 
it. My main concern is to make sure that changes don't break the simple 
use case: generating compile_commands.json in an in-tree build without 
any arguments to the script.

>
>$ scripts/clang-tools/gen_compile_commands.py -d /tmp/build/perf -s tools/perf
>
>diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
>index 8ddb5d099029..ba3b2dcdc3e1 100755
>--- a/scripts/clang-tools/gen_compile_commands.py
>+++ b/scripts/clang-tools/gen_compile_commands.py
>@@ -27,7 +27,8 @@ def parse_arguments():
>
>     Returns:
>         log_level: A logging level to filter log output.
>-        directory: The work directory where the objects were built.
>+        obj_directory: The work directory where the objects were built.
>+        src_directory: The source directory from which the objects were built.
>         ar: Command used for parsing .a archives.
>         output: Where to write the compile-commands JSON file.
>         paths: The list of files/directories to handle to find .cmd files.
>@@ -35,10 +36,15 @@ def parse_arguments():
>     usage = 'Creates a compile_commands.json database from kernel .cmd files'
>     parser = argparse.ArgumentParser(description=usage)
>
>-    directory_help = ('specify the output directory used for the kernel build '
>-                      '(defaults to the working directory)')
>-    parser.add_argument('-d', '--directory', type=str, default='.',
>-                        help=directory_help)
>+    obj_directory_help = ('specify the output directory used for the kernel build '
>+                          '(defaults to the working directory)')
>+    parser.add_argument('-d', '--obj_directory', type=str, default='.',
>+                        help=obj_directory_help)
>+
>+    src_directory_help = ('specify the source directory used for the kernel build '
>+                          '(defaults to the working directory)')
>+    parser.add_argument('-s', '--src_directory', type=str, default='.',
>+                        help=src_directory_help)
>
>     output_help = ('path to the output command database (defaults to ' +
>                    _DEFAULT_OUTPUT + ')')
>@@ -55,16 +61,17 @@ def parse_arguments():
>
>     paths_help = ('directories to search or files to parse '
>                   '(files should be *.o, *.a, or modules.order). '
>-                  'If nothing is specified, the current directory is searched')
>+                  'If nothing is specified, the build directory is searched')
>     parser.add_argument('paths', type=str, nargs='*', help=paths_help)
>
>     args = parser.parse_args()
>
>     return (args.log_level,
>-            os.path.abspath(args.directory),
>+            os.path.abspath(args.obj_directory),
>+            os.path.abspath(args.src_directory),
>             args.output,
>             args.ar,
>-            args.paths if len(args.paths) > 0 else [args.directory])
>+            args.paths if len(args.paths) > 0 else [args.obj_directory])
>
>
> def cmdfiles_in_dir(directory):
>@@ -154,22 +161,23 @@ def cmdfiles_for_modorder(modorder):
>                     yield to_cmdfile(obj)
>
>
>-def process_line(root_directory, command_prefix, file_path):
>+def process_line(obj_directory, src_directory, command_prefix, file_path):
>     """Extracts information from a .cmd line and creates an entry from it.
>
>     Args:
>-        root_directory: The directory that was searched for .cmd files. Usually
>+        obj_directory: The directory that was searched for .cmd files. Usually
>             used directly in the "directory" entry in compile_commands.json.
>+        src_directory: The directory that was used to build the object files.
>         command_prefix: The extracted command line, up to the last element.
>         file_path: The .c file from the end of the extracted command.
>-            Usually relative to root_directory, but sometimes absolute.
>+            Usually relative to obj_directory, but sometimes absolute.
>
>     Returns:
>         An entry to append to compile_commands.
>
>     Raises:
>         ValueError: Could not find the extracted file based on file_path and
>-            root_directory or file_directory.
>+            src_directory or file_directory.
>     """
>     # The .cmd files are intended to be included directly by Make, so they
>     # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
>@@ -177,20 +185,23 @@ def process_line(root_directory, command_prefix, file_path):
>     # by Make, so this code replaces the escaped version with '#'.
>     prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
>
>-    # Use os.path.abspath() to normalize the path resolving '.' and '..' .
>-    abs_path = os.path.abspath(os.path.join(root_directory, file_path))
>+    if os.path.isabs(file_path):
>+        abs_path = file_path
>+    else:
>+        # Use os.path.abspath() to normalize the path resolving '.' and '..' .
>+        abs_path = os.path.abspath(os.path.join(src_directory, file_path))
>     if not os.path.exists(abs_path):
>         raise ValueError('File %s not found' % abs_path)
>     return {
>-        'directory': root_directory,
>+        'directory': obj_directory,
>         'file': abs_path,
>-        'command': prefix + file_path,
>+        'command': prefix + abs_path,
>     }
>
>
> def main():
>     """Walks through the directory and finds and parses .cmd files."""
>-    log_level, directory, output, ar, paths = parse_arguments()
>+    log_level, obj_directory, src_directory, output, ar, paths = parse_arguments()
>
>     level = getattr(logging, log_level)
>     logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
>@@ -221,8 +232,8 @@ def main():
>                 result = line_matcher.match(f.readline())
>                 if result:
>                     try:
>-                        entry = process_line(directory, result.group(1),
>-                                             result.group(2))
>+                        entry = process_line(obj_directory, src_directory,
>+                                             result.group(1), result.group(2))
>                         compile_commands.append(entry)
>                     except ValueError as err:
>                         logging.info('Could not add line from %s: %s',
