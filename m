Return-Path: <linux-kbuild+bounces-10259-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E3CD1AD2
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 20:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B205302EDA3
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 19:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CAC34AAEB;
	Fri, 19 Dec 2025 19:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWX+j/ZN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2325834AAE2;
	Fri, 19 Dec 2025 19:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766173673; cv=none; b=CGwIZMZvSWRtVuaeggpCUmMFnU6rAxeub72bOls/S95F1/jAySzd0OMMT7fxVOnTnMHHkBWrOwHojwu7GY0HvJK1u20fTvCBIMnvHWipbnhnLbCCKmlHeD128aq27KCqUzqLtT8GvN9mYi9IZaWd26mGKS495KUdsVfFxWQZnKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766173673; c=relaxed/simple;
	bh=ahnklD8wORDhqxGMbS9i1+02tEsICBFL946J+GACCa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jr7rXhz/Typv8cwD2J72/9YFXXUfMoigNLcuwiYtfWnxlfX76d675b+pMLU5we504RaAbpfWb4SDPl5cW1GKHfCCPYFWWYq1ZX48P03XhU6P2tV9kLG+U1wA+oUIsTBtia+uZhzTFLKQbqYAAH2/ITM4CZhdZhEDZCXeofBdcgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWX+j/ZN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C8CC4CEF1;
	Fri, 19 Dec 2025 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766173672;
	bh=ahnklD8wORDhqxGMbS9i1+02tEsICBFL946J+GACCa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWX+j/ZNZypVxNfs89M4aNVcj7H6c+U3GCxKJgp02HOL1JTUm/nhqJmDG7UOU4ftY
	 T+YrSsNPf2XyYqERI8R9TK3eQ76DDiUPwai43+STAvDD44+1Ljlc7LsaW3YIqnyFnM
	 jY4et1nYbJp7ahWBZc9BYuHZBgo/GyMH27+LkErUGc3ovPRQ8MOs1V1HGFyDj7YSkp
	 qIDP9/64nh/AT2bxk4lFXQQiXFg+l34hTsBsYakc2Z8VNcw7KS74GqIPyBJHf3aLu6
	 EWCx/OXxhcUGqqX33STgDLOWnJY9uspAanoBtamTATAce9Nokn0a9J/7dn87EKKRhY
	 ascYxZtOnhX8Q==
Date: Fri, 19 Dec 2025 12:47:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] scripts: add tool to run containerized builds
Message-ID: <20251219194748.GA1404325@ax162>
References: <cover.1765374789.git.gtucker@gtucker.io>
 <97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>

Hi Guillaume,

On Wed, Dec 10, 2025 at 02:58:28PM +0100, Guillaume Tucker wrote:
> Add a 'scripts/container' tool written in Python to run any command in
> the source tree from within a container.  This can typically be used
> to call 'make' with a compiler toolchain image to run reproducible
> builds but any arbitrary command can be run too.  Only Docker and
> Podman are supported for this initial version.
> 
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>

Overall, I like the concept here. It is simple and should be relatively
easy for people to drive. I think having some short quick examples (or a
link to the Documentation file that inclues them) would be good in case
people stumble across the script first.

One initial comment (or perhaps feature request) would be handling O= /
KBUILD_OUTPUT for building out of tree. It may be a little complicated
for mounting the build directory into the container but it might make it
easier for folks who build out of tree to use.

> ---
>  scripts/container | 112 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100755 scripts/container
> 
> diff --git a/scripts/container b/scripts/container
> new file mode 100755
> index 000000000000..74644ac33685
> --- /dev/null
> +++ b/scripts/container
> @@ -0,0 +1,112 @@
> +#!/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Copyright (C) 2025 Guillaume Tucker
> +
> +"""Containerized builds"""
> +
> +import argparse
> +import logging
> +import os
> +import subprocess
> +import sys
> +
> +
> +def get_logger(verbose):
> +    """Set up a logger with the appropriate level"""
> +    logger = logging.getLogger('container')
> +    handler = logging.StreamHandler()
> +    handler.setFormatter(logging.Formatter(
> +        fmt='[container {levelname}] {message}', style='{'
> +    ))
> +    logger.addHandler(handler)
> +    logger.setLevel(logging.DEBUG if verbose is True else logging.INFO)
> +    return logger
> +
> +
> +def run_docker(args):
> +    """Run a command in a Docker container"""
> +    uid = args.uid or os.getuid()
> +    gid = args.gid or args.uid or os.getgid()
> +    cmd = [
> +        'docker', 'run',
> +        '--interactive',
> +        '--volume', f'{os.getcwd()}:/src',

Is there a minimum python version required for this? If not, I would
prefer using pathlib here:

  from pathlib import Path

then

  Path.cwd()

> +        '--workdir', '/src',
> +        '--user', f'{uid}:{gid}'
> +    ]
> +    if args.env_file:
> +        cmd += ['--env-file', args.env_file]
> +    cmd.append(args.image)
> +    cmd += args.cmd
> +    return subprocess.call(cmd)
> +
> +
> +def run_podman(args):
> +    """Run a command in a Podman container"""
> +    uid = args.uid or 1000
> +    gid = args.gid or args.uid or 1000

Why 1000 instead of using getuid() and getgid() as above?

> +    cmd = [
> +        'podman', 'run',
> +        '--interactive',
> +        '--volume', f'{os.getcwd()}:/src',
> +        '--workdir', '/src',
> +        '--userns', f'keep-id:uid={uid},gid={gid}',
> +    ]
> +    if args.env_file:
> +        cmd += ['--env-file', args.env_file]
> +    cmd.append(args.image)
> +    cmd += args.cmd
> +    return subprocess.call(cmd)

Most of these two functions are the same. Maybe they could be abstracted
into a simple class so that most of the logic could be shared between
the two implementations? That also might simplify main() a bit and make
fulfilling David's request a little simpler as well.

> +def main(args):
> +    """Main entry point for the container tool"""
> +    logger = get_logger(args.verbose)
> +    logger.debug("runtime=%s, image=%s", args.runtime, args.image)
> +    runtimes = {
> +        'docker': run_docker,
> +        'podman': run_podman,
> +    }
> +    handler = runtimes.get(args.runtime)
> +    if not handler:
> +        logger.error("Unknown container runtime: %s", args.runtime)
> +        return 1
> +    try:
> +        return handler(args)
> +    except KeyboardInterrupt:
> +        logger.error("aborted")
> +        return 1
> +
> +
> +if __name__ == '__main__':
> +    parser = argparse.ArgumentParser("Containerized builds")
> +    parser.add_argument(
> +        '-e', '--env-file',
> +        help="Path to an environment file to load in the container."
> +    )

Is there documentation for how an environment file should be formatter?

> +    parser.add_argument(
> +        '-g', '--gid',
> +        help="Group ID to use inside the container."
> +    )
> +    parser.add_argument(
> +        '-i', '--image', default='gcc',
> +        help="Container image, default is gcc."
> +    )
> +    parser.add_argument(
> +        '-r', '--runtime', choices=['docker', 'podman'], default='docker',
> +        help="Container runtime, default is docker."
> +    )
> +    parser.add_argument(
> +        '-u', '--uid',
> +        help="User ID to use inside the container.  If the -g option is not"
> +        "specified, the user ID will also be used for the group ID."
> +    )
> +    parser.add_argument(
> +        '-v', '--verbose', action='store_true',
> +        help="Enable verbose output."
> +    )
> +    parser.add_argument(
> +        'cmd', nargs='+',
> +        help="Command to run in the container"
> +    )
> +    sys.exit(main(parser.parse_args(sys.argv[1:])))
> -- 
> 2.47.3
> 

