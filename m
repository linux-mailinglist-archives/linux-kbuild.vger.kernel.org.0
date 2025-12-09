Return-Path: <linux-kbuild+bounces-10035-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD09CB004D
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Dec 2025 14:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 819FC301842C
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Dec 2025 13:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EABE2EBDE0;
	Tue,  9 Dec 2025 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/zGNqGS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6470B26CE04
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Dec 2025 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765285647; cv=none; b=Vdnh0s5E0eyik8bAMjkbi8SB3+RMHsaYq7DVS7XP9vP1sJM1OTpckEWbbScmR7PcYvkhntzW8gguvdq4Lj1Kgeo4IaEWQ471NeBwNbd8vmYkDYnzo5x4LFI9KesoAh3WSraO90hdJEP4FDIIPyzBnEqUeHJccXAuL6do8by5GO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765285647; c=relaxed/simple;
	bh=KUa9aJm+1Q1mYo9B8g2XNK9lG0dCj/Q59hq3/77vBqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyjdP/PL2V38ocMGHK3Xxf+FQB55UUMHJ+HsqxeXrtu7rViRqT5VqRpuOPqLPRTASCyj/2BTYNnUrLYo2eJS2HviaQ3m6S9WKbM2Jrb3oBAnAwdO94ld9YyAYJBlpYDlNDspM4ZBx9cKJbV+w4qA92kuo7e1yrwOJfWyC8NvZ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/zGNqGS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6ABC4CEF5;
	Tue,  9 Dec 2025 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765285646;
	bh=KUa9aJm+1Q1mYo9B8g2XNK9lG0dCj/Q59hq3/77vBqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/zGNqGSsBD7q6eBFsNrgFy505iB+vB7MRQbdjB5xqp0ZTNr8KdukxFv2ZdprHi/k
	 QQC6+wBlsipTYYbmnzls2t/U0Gifjxp6OWc1KqmjxlH6nr3mHLeq40S1qJuXfbmU84
	 YGSO3PS5/d9FNFHnsUzunVBx7xsM1cxvRpQntcM5St9dHUrvcr5EYOF3jZP0iSmx1N
	 N0hvNZFrYpRFOmbSRDkPULJWU1XDsOhaD67+CmP1Wo/cYEcSSZmNqJftkoKm1P8VOu
	 8wGf54+9qkel5hr90K6s44dq4OQTB2LpG3pIYz/KpCdKPArziVFu3wEKz2WXjCLGxw
	 1RegQxXEE+e5Q==
Date: Tue, 9 Dec 2025 14:07:16 +0100
From: Nicolas Schier <nsc@kernel.org>
To: "Grube, Jack" <jrg72@njit.edu>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] usr/gen_initramfs.sh: (cosmetic) improve comments and
 formatting
Message-ID: <aTgfBL14P77rJh7Z@derry.ads.avm.de>
References: <CY4PR03MB3222B6B21B6A0E160CEF6CBBFBC5A@CY4PR03MB3222.namprd03.prod.outlook.com>
 <CAA_eE_XSJm0ujLfZVu1WzRaMnzODW_4nw=+-2k2zxS_9iaQEEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA_eE_XSJm0ujLfZVu1WzRaMnzODW_4nw=+-2k2zxS_9iaQEEg@mail.gmail.com>

Hi Jack,

On Wed, Nov 05, 2025 at 01:27:32PM -0500, Grube, Jack wrote:
> I heartily apologize for the double email. I got the order of
> arguments mixed up when using git format-patch the first time. This is
> the correct patch.
> 
> Signed-off-by: Jack Grube <jrg72@njit.edu>

thanks for your contribution and sorry for the long delay.  Common
practise of Linux patch submissions obeys several rules (cp. [1] and
other documents in that folder), for example:

  * send logically independent changes as separate patches
    (here for example: SPDX header; code indentation; re-formatting of
    comments)

  * describe the changes for each patch (what problem you want to fix,
    why each patch is important and shall be applied).

[1]: Documentation/process/submitting-patches.rst

Iff you might send another patch (set), please make use of '--dry-run'
or similar options to check your patches prior to sending them out.

`scripts/get_maintainer.pl --email --no-rolestats` helps obtaining a
list of reasonable patch mail receipients.

> ---
>  usr/gen_initramfs.sh | 48 +++++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
> index 7eba2fddf0ef..ff8ddd373fc1 100755
> --- a/usr/gen_initramfs.sh
> +++ b/usr/gen_initramfs.sh
> @@ -1,8 +1,9 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later

Good catch.  To my own surprise, there are even more files below usr/
that are missing SPDX headers.

Please put SPDX header addition into a separate patch.

>  # Copyright (C) Martin Schlemmer <azarah@nosferatu.za.org>
>  # Copyright (C) 2006 Sam Ravnborg <sam@ravnborg.org>
> -#
> -# Released under the terms of the GNU GPL
> +
> +# Released under the terms of the GNU GPL.

I don't think that this a relevant enhancement.

>  #
>  # Generate a cpio packed initramfs. It uses gen_init_cpio to generate
>  # the cpio archive.
> @@ -18,15 +19,15 @@ $0 [-o <file>] [-l <dep_list>] [-u <uid>] [-g
> <gid>] {-d | <cpio_source>} ...
>     -o <file>      Create initramfs file named <file> by using gen_init_cpio
>     -l <dep_list>  Create dependency list named <dep_list>
>     -u <uid>       User ID to map to user ID 0 (root).
> -              <uid> is only meaningful if <cpio_source> is a
> -              directory.  "squash" forces all files to uid 0.
> +                  <uid> is only meaningful if <cpio_source> is a
> +                  directory.  "squash" forces all files to uid 0.
>     -g <gid>       Group ID to map to group ID 0 (root).
> -              <gid> is only meaningful if <cpio_source> is a
> -              directory.  "squash" forces all files to gid 0.
> +                  <gid> is only meaningful if <cpio_source> is a
> +                  directory.  "squash" forces all files to gid 0.
>     -d <date>      Use date for all file mtime values
>     <cpio_source>  File list or directory for cpio archive.
> -              If <cpio_source> is a .cpio file it will be used
> -              as direct input to initramfs.
> +                  If <cpio_source> is a .cpio file it will be used
> +                  as direct input to initramfs.

This patch is not applicable, did you generate it properly with 'git
format-patch' or something similar?  usr/gen_initramfs.sh starts with
one or two tabs in these lines, your patch does not match that.

(And it seems to me, that your editor settings might be suboptimal for
kernel code; please use a tab size of 8 characters if you want to
optimise indenting.)

> 
>  All options except -o and -l may be repeated and are interpreted
>  sequentially and immediately.  -u and -g states are preserved across
> @@ -35,8 +36,9 @@ to reset the root/group mapping.
>  EOF
>  }
> 
> +

Please do not add arbitrary empty lines.

>  # awk style field access
> -# $1 - field number; rest is argument string
> +# $1 -- field number; the rest is the argument string.

While I think that most of your changes in the comments (this one and
the remaining) are correct, I am not convinced that it's worth the
effort.


Kind regards,
Nicolas



>  field() {
>     shift $1 ; echo $1
>  }
> @@ -44,7 +46,7 @@ field() {
>  filetype() {
>     local argv1="$1"
> 
> -   # symlink test must come before file test
> +   # The symlink test must come before the file test.
>     if [ -L "${argv1}" ]; then
>         echo "slink"
>     elif [ -f "${argv1}" ]; then
> @@ -81,9 +83,9 @@ list_parse() {
>     echo "$1" | sed 's/:/\\:/g; s/$/ \\/' >> $dep_list
>  }
> 
> -# for each file print a line in following format
> +# For each file, print a line in following format:
>  # <filetype> <name> <path to file> <octal mode> <uid> <gid>
> -# for links, devices etc the format differs. See gen_init_cpio for details
> +# For links, devices, etc., the format differs. See gen_init_cpio for details.
>  parse() {
>     local location="$1"
>     local name="/${location#${srcdir}}"
> @@ -143,14 +145,14 @@ header() {
>     printf "\n#####################\n# $1\n" >> $cpio_list
>  }
> 
> -# process one directory (incl sub-directories)
> +# Process one directory (including sub-directories).
>  dir_filelist() {
>     header "$1"
> 
>     srcdir=$(echo "$1" | sed -e 's://*:/:g')
>     dirlist=$(find "${srcdir}" -printf "%p %m %U %G\n" | LC_ALL=C sort)
> 
> -   # If $dirlist is only one line, then the directory is empty
> +   # If $dirlist is only one line, then the directory is empty.
>     if [  "$(echo "${dirlist}" | wc -l)" -gt 1 ]; then
>         print_mtime "$1"
> 
> @@ -179,7 +181,7 @@ input_file() {
>             done
>         fi
>     elif [ -d "$1" ]; then
> -       # If a directory is specified then add all files in it to fs
> +       # If a directory is specified, then add all files in it to the
> file system.
>         dir_filelist "$1"
>     else
>         echo "  ${prog}: Cannot open '$1'" >&2
> @@ -202,26 +204,26 @@ while [ $# -gt 0 ]; do
>     arg="$1"
>     shift
>     case "$arg" in
> -       "-l")   # files included in initramfs - used by kbuild
> +       "-l")   # files included in initramfs--used by kbuild
>             dep_list="$1"
>             echo "deps_initramfs := \\" > $dep_list
>             shift
>             ;;
> -       "-o")   # generate cpio image named $1
> +       "-o")   # Generate a cpio image named $1.
>             output="-o $1"
>             shift
>             ;;
> -       "-u")   # map $1 to uid=0 (root)
> +       "-u")   # Map $1 to uid=0 (root).
>             root_uid="$1"
>             [ "$root_uid" = "-1" ] && root_uid=$(id -u || echo 0)
>             shift
>             ;;
> -       "-g")   # map $1 to gid=0 (root)
> +       "-g")   # Map $1 to gid=0 (root).
>             root_gid="$1"
>             [ "$root_gid" = "-1" ] && root_gid=$(id -g || echo 0)
>             shift
>             ;;
> -       "-d")   # date for file mtimes
> +       "-d")   # Date for file mtimes
>             timestamp="$(date -d"$1" +%s || :)"
>             if test -n "$timestamp"; then
>                 timestamp="-t $timestamp"
> @@ -237,7 +239,7 @@ while [ $# -gt 0 ]; do
>                 "-"*)
>                     unknown_option
>                     ;;
> -               *)  # input file/dir - process it
> +               *)  # input file/dir -- process it
>                     input_file "$arg"
>                     ;;
>             esac
> @@ -245,6 +247,6 @@ while [ $# -gt 0 ]; do
>     esac
>  done
> 
> -# If output_file is set we will generate cpio archive
> -# we are careful to delete tmp files
> +# If the output_file is set, we will generate cpio archive.
> +# We are careful to delete tmp files.
>  usr/gen_init_cpio $output $timestamp $cpio_list
> --
> Jack Grube
> 
> 
> On Wed, Nov 5, 2025 at 1:06 PM Jack Grube <jrg72@njit.edu> wrote:
> >
> > This patch rewrites comments to be more descriptive and as complete sentences;
> > it also tweaks the usage function's output is also adjusted to make it more readable
> > when using the -h flag.
> > I ran the script with the -h option to verify that the usage output remains correct,
> > but no other testing was performed as no core logic was changed.
> > Lastly, I added an SPDX license identifier for any tools that may depend on that.
> > I welcome feedback there are any areas for improvement.
> >
> >
> > diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
> > index 4490d496f374..7eba2fddf0ef 100755
> > --- a/usr/gen_initramfs.sh
> > +++ b/usr/gen_initramfs.sh
> > @@ -1,8 +1,8 @@
> >  #!/bin/sh
> > -# SPDX-License-Identifier: GPL-2.0-or-later
> >  # Copyright (C) Martin Schlemmer <azarah@nosferatu.za.org>
> >  # Copyright (C) 2006 Sam Ravnborg <sam@ravnborg.org>
> > -# Released under the terms of the GNU GPL.
> > +#
> > +# Released under the terms of the GNU GPL
> >  #
> >  # Generate a cpio packed initramfs. It uses gen_init_cpio to generate
> >  # the cpio archive.
> > @@ -18,15 +18,15 @@ $0 [-o <file>] [-l <dep_list>] [-u <uid>] [-g <gid>] {-d | <cpio_source>} ...
> >       -o <file>      Create initramfs file named <file> by using gen_init_cpio
> >       -l <dep_list>  Create dependency list named <dep_list>
> >       -u <uid>       User ID to map to user ID 0 (root).
> > -                    <uid> is only meaningful if <cpio_source> is a
> > -                    directory.  "squash" forces all files to uid 0.
> > +                  <uid> is only meaningful if <cpio_source> is a
> > +                  directory.  "squash" forces all files to uid 0.
> >       -g <gid>       Group ID to map to group ID 0 (root).
> > -                    <gid> is only meaningful if <cpio_source> is a
> > -                    directory.  "squash" forces all files to gid 0.
> > +                  <gid> is only meaningful if <cpio_source> is a
> > +                  directory.  "squash" forces all files to gid 0.
> >       -d <date>      Use date for all file mtime values
> >       <cpio_source>  File list or directory for cpio archive.
> > -                    If <cpio_source> is a .cpio file it will be used
> > -                    as direct input to initramfs.
> > +                  If <cpio_source> is a .cpio file it will be used
> > +                  as direct input to initramfs.
> >
> >  All options except -o and -l may be repeated and are interpreted
> >  sequentially and immediately.  -u and -g states are preserved across
> > @@ -35,9 +35,8 @@ to reset the root/group mapping.
> >  EOF
> >  }
> >
> > -
> >  # awk style field access
> > -# $1 -- field number; the rest is the argument string.
> > +# $1 - field number; rest is argument string
> >  field() {
> >       shift $1 ; echo $1
> >  }
> > @@ -45,7 +44,7 @@ field() {
> >  filetype() {
> >       local argv1="$1"
> >
> > -     # The symlink test must come before the file test.
> > +     # symlink test must come before file test
> >       if [ -L "${argv1}" ]; then
> >             echo "slink"
> >       elif [ -f "${argv1}" ]; then
> > @@ -82,9 +81,9 @@ list_parse() {
> >       echo "$1" | sed 's/:/\\:/g; s/$/ \\/' >> $dep_list
> >  }
> >
> > -# For each file, print a line in following format:
> > +# for each file print a line in following format
> >  # <filetype> <name> <path to file> <octal mode> <uid> <gid>
> > -# For links, devices, etc., the format differs. See gen_init_cpio for details.
> > +# for links, devices etc the format differs. See gen_init_cpio for details
> >  parse() {
> >       local location="$1"
> >       local name="/${location#${srcdir}}"
> > @@ -144,14 +143,14 @@ header() {
> >       printf "\n#####################\n# $1\n" >> $cpio_list
> >  }
> >
> > -# Process one directory (including sub-directories).
> > +# process one directory (incl sub-directories)
> >  dir_filelist() {
> >       header "$1"
> >
> >       srcdir=$(echo "$1" | sed -e 's://*:/:g')
> >       dirlist=$(find "${srcdir}" -printf "%p %m %U %G\n" | LC_ALL=C sort)
> >
> > -     # If $dirlist is only one line, then the directory is empty.
> > +     # If $dirlist is only one line, then the directory is empty
> >       if [  "$(echo "${dirlist}" | wc -l)" -gt 1 ]; then
> >             print_mtime "$1"
> >
> > @@ -180,7 +179,7 @@ input_file() {
> >                   done
> >             fi
> >       elif [ -d "$1" ]; then
> > -           # If a directory is specified, then add all files in it to the file system.
> > +           # If a directory is specified then add all files in it to fs
> >             dir_filelist "$1"
> >       else
> >             echo "  ${prog}: Cannot open '$1'" >&2
> > @@ -203,26 +202,26 @@ while [ $# -gt 0 ]; do
> >       arg="$1"
> >       shift
> >       case "$arg" in
> > -           "-l") # files included in initramfs--used by kbuild
> > +           "-l") # files included in initramfs - used by kbuild
> >                   dep_list="$1"
> >                   echo "deps_initramfs := \\" > $dep_list
> >                   shift
> >                   ;;
> > -           "-o") # Generate a cpio image named $1.
> > +           "-o") # generate cpio image named $1
> >                   output="-o $1"
> >                   shift
> >                   ;;
> > -           "-u") # Map $1 to uid=0 (root).
> > +           "-u") # map $1 to uid=0 (root)
> >                   root_uid="$1"
> >                   [ "$root_uid" = "-1" ] && root_uid=$(id -u || echo 0)
> >                   shift
> >                   ;;
> > -           "-g") # Map $1 to gid=0 (root).
> > +           "-g") # map $1 to gid=0 (root)
> >                   root_gid="$1"
> >                   [ "$root_gid" = "-1" ] && root_gid=$(id -g || echo 0)
> >                   shift
> >                   ;;
> > -           "-d") # Date for file mtimes
> > +           "-d") # date for file mtimes
> >                   timestamp="$(date -d"$1" +%s || :)"
> >                   if test -n "$timestamp"; then
> >                         timestamp="-t $timestamp"
> > @@ -238,7 +237,7 @@ while [ $# -gt 0 ]; do
> >                         "-"*)
> >                               unknown_option
> >                               ;;
> > -                       *)    # input file/dir -- process it
> > +                       *)    # input file/dir - process it
> >                               input_file "$arg"
> >                               ;;
> >                   esac
> > @@ -246,6 +245,6 @@ while [ $# -gt 0 ]; do
> >       esac
> >  done
> >
> > -# If the output_file is set, we will generate cpio archive.
> > -# We are careful to delete tmp files.
> > +# If output_file is set we will generate cpio archive
> > +# we are careful to delete tmp files
> >  usr/gen_init_cpio $output $timestamp $cpio_list
> >
> 
> 
> -- 
> Jack Grube
> B.S. Computer Science, 2026.
> Ying Wu College of Computing, NJIT.
> Secretary — Newman Catholic Club, 2023–24; President 2024–26

