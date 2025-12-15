Return-Path: <linux-kbuild+bounces-10097-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42509CBD2B8
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Dec 2025 10:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECF3C3009F8D
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Dec 2025 09:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB692256C8B;
	Mon, 15 Dec 2025 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="pnErKi7r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57D4155C97;
	Mon, 15 Dec 2025 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791052; cv=none; b=ftzxTVSr0bdKr1ZVfGnMIRkLcESKNE+2PL2jSyOJrndJ5sGlmYBep/2Znsv/3pbKPf3nxdJNneAo6cz3Q3VDU2nLHpO2WyzgColuliIGqoBcUrRR9MuyS4WvVlBjLyxZrYbYYxiAEMs/tlh5It45u0PBHrwc29z/bMJtCXGtQvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791052; c=relaxed/simple;
	bh=swqRlMoAO3NvcCoEm7GKISvmasPoc2eXkU2/fm394BE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+Darv/Ad0tY1RXB3NWGTlcvFkRSxhQ/eg45AonCOZ83aFA7KNhwkTAxwb0ELXqbc1pokqjFMNoO5J0EvnyquOgR0rL5K3R2qyfY7k59PosI1NGNCKnIEyFA71OuA5DIhjAetMM3Y9R13r+KvfaJWK+fKR3gkhFHRpAw3f6SGic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=pnErKi7r; arc=none smtp.client-ip=178.154.239.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:1698:0:640:befc:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id 4BDA0C026A;
	Mon, 15 Dec 2025 12:24:14 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 9OPpYE5LtiE0-E5fX9gQU;
	Mon, 15 Dec 2025 12:24:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1765790653;
	bh=kprlpmhDORKZihgrcnjt54NlN/3ATtQKhKSPmCXRgxU=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=pnErKi7r/pJ6EEz4IpoCH+Ck5x1TXYefWSUcsAA1a24sJ/0h0LFUXMDT60+PlrDa0
	 oqkV/IXHtDkV5Qk+gjBVXuv1HW31jrpzfdg58OrbPnl9XZ3g5YRZlrltVe32bZwj/F
	 uvkfCjASOqj6tKOrspotkEOXN1rdzxXN9YIZ2Bh0=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Mon, 15 Dec 2025 12:24:07 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 workflows@vger.kernel.org, llvm@lists.linux.dev, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] scripts: add tool to run containerized builds
Message-ID: <20251215122407.720d65bf@nimda>
In-Reply-To: <97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>
References: <cover.1765374789.git.gtucker@gtucker.io>
	<97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Guillaume,

Excellent work! Just one note from my side so far:

On Wed, 10 Dec 2025 14:58:28 +0100
Guillaume Tucker <gtucker@gtucker.io> wrote:

> Add a 'scripts/container' tool written in Python to run any command in
> the source tree from within a container.  This can typically be used
> to call 'make' with a compiler toolchain image to run reproducible
> builds but any arbitrary command can be run too.  Only Docker and
> Podman are supported for this initial version.
> 
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Link:
> https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io> ---
>  scripts/container | 112
> ++++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 112
> insertions(+) create mode 100755 scripts/container
> 
> diff --git a/scripts/container b/scripts/container
> new file mode 100755
> index 000000000000..74644ac33685
> --- /dev/null
> +++ b/scripts/container
> @@ -0,0 +1,112 @@
> +#!/bin/env python3

By default, this will not work on NixOS because /bin/env is
not a valid path.

It will fail like this:

	$ cat something
	#!/bin/env python3
	
	$ ./something
	zsh: ./something: bad interpreter: /bin/env: no such file or
	directory

Is there a reason for not using /usr/bin/env?

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
> +    logger.setLevel(logging.DEBUG if verbose is True else
> logging.INFO)
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
> +
> +
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
> +    parser.add_argument(
> +        '-g', '--gid',
> +        help="Group ID to use inside the container."
> +    )
> +    parser.add_argument(
> +        '-i', '--image', default='gcc',
> +        help="Container image, default is gcc."
> +    )
> +    parser.add_argument(
> +        '-r', '--runtime', choices=['docker', 'podman'],
> default='docker',
> +        help="Container runtime, default is docker."
> +    )
> +    parser.add_argument(
> +        '-u', '--uid',
> +        help="User ID to use inside the container.  If the -g option
> is not"
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

-Onur

