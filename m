Return-Path: <linux-kbuild+bounces-10815-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGYTEZZbcmkljAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10815-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 18:17:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F226B012
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 18:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09FBB3061CEE
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 17:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23A33DC964;
	Thu, 22 Jan 2026 16:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="bIaC3XnU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward502a.mail.yandex.net (forward502a.mail.yandex.net [178.154.239.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0263590B7;
	Thu, 22 Jan 2026 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769100007; cv=none; b=PyzB3jIAwy80jGXvRggrWWkRhFlDY4WqwkqHdPDtkoLlqN9Ql2EeuAxirlwY6smHxNxCv8A1bltgyfUqOSVyfY8WBTPzDbK+qD0w1Nmsa3UjmYtwoSGapE+HAPGa80YvCTC5ZTrYUoKtKLiJxA7A3hRzYQ56Yy46jBETz26SK0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769100007; c=relaxed/simple;
	bh=okxm9qDjurKqOfegnygaQcQpA/gDZI5OU9/5MSg3qCA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ruxksw8UuAqegAFAdvU1MUsZr0SWI/YfzaGsAQXXf7NvNHjOjzW7qdTkkNuvnxRwjHFVz4lq40KgG/x+0p15njZ5zoIEFI9kvMZeWmxLpgDdBmKPYfqkoJ8RYZfPHOsIsaHYheBKBfMgy3SDSxi1aW3n6gb7HWjWhjWsFO8j/Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=bIaC3XnU; arc=none smtp.client-ip=178.154.239.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:bb89:0:640:ae22:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTPS id 164BC81748;
	Thu, 22 Jan 2026 19:39:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id odfMBt0GNKo0-6fpR6Jy3;
	Thu, 22 Jan 2026 19:39:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1769099994;
	bh=IVXS/eBGU64zWQ3RZilF4LHNzfs9+NLtxK6fSbGpJRM=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=bIaC3XnUDMc2b65SpM5KvK9J2SM9bYNyjxTIKNlMWSqVOBfdS6nTBcjyexKF3CJCS
	 TQz5BRnb5gkvogQC7CDM2rpzNX3Y2dMY/RS5kTg8TWiEldn2hfMrR1TFQOP+NsYI5g
	 L0DuWat1h2+bv9aBCRw24UgXrDNzii2IB0YM5yFU=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 22 Jan 2026 19:39:48 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>, Arnd
 Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/2] scripts: add tool to run containerized builds
Message-ID: <20260122193948.6af09199@nimda>
In-Reply-To: <611ce02f-2b48-4338-b37f-1df39e02da03@gtucker.io>
References: <cover.1769090419.git.gtucker@gtucker.io>
	<9b8da20157e409e8fa3134d2101678779e157256.1769090419.git.gtucker@gtucker.io>
	<20260122172928.1d922490@nimda>
	<611ce02f-2b48-4338-b37f-1df39e02da03@gtucker.io>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,reject];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10815-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gtucker.io:email,onurozkan.dev:email,onurozkan.dev:dkim,args.shell:url]
X-Rspamd-Queue-Id: 52F226B012
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 15:59:54 +0100
Guillaume Tucker <gtucker@gtucker.io> wrote:

> Hi Onur,
>=20
> On 22/01/2026 15:29, Onur =C3=96zkan wrote:
> > Hi Guillaume,
> >=20
> > Just 2 notes from my end.
> >=20
> > On Thu, 22 Jan 2026 15:06:59 +0100
> > Guillaume Tucker <gtucker@gtucker.io> wrote:
> >=20
> >> Add a 'scripts/container' tool written in Python to run any
> >> command in the source tree from within a container.  This can
> >> typically be used to call 'make' with a compiler toolchain image
> >> to run reproducible builds but any arbitrary command can be run
> >> too.  Only Docker and Podman are supported in this initial version.
> >>
> >> Add a new entry to MAINTAINERS accordingly.
> >>
> >> Cc: Nathan Chancellor <nathan@kernel.org>
> >> Cc: Nicolas Schier <nsc@kernel.org>
> >> Cc: Miguel Ojeda <ojeda@kernel.org>
> >> Cc: David Gow <davidgow@google.com>
> >> Cc: "Onur =C3=96zkan" <work@onurozkan.dev>
> >> Link:
> >> https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtuck=
er.io/
> >> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io> ---
> >>  MAINTAINERS       |   6 ++
> >>  scripts/container | 199
> >> ++++++++++++++++++++++++++++++++++++++++++++++ 2 files changed, 205
> >> insertions(+) create mode 100755 scripts/container
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index da9dbc1a4019..affd55ff05e0 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -6384,6 +6384,11 @@ S:	Supported
> >>  F:	drivers/video/console/
> >>  F:	include/linux/console*
> >> =20
> >> +CONTAINER BUILD SCRIPT
> >> +M:	Guillaume Tucker <gtucker@gtucker.io>
> >> +S:	Maintained
> >> +F:	scripts/container
> >> +
> >>  CONTEXT TRACKING
> >>  M:	Frederic Weisbecker <frederic@kernel.org>
> >>  M:	"Paul E. McKenney" <paulmck@kernel.org>
> >> @@ -13676,6 +13681,7 @@ F:	scripts/Makefile*
> >>  F:	scripts/bash-completion/
> >>  F:	scripts/basic/
> >>  F:	scripts/clang-tools/
> >> +F:	scripts/container
> >>  F:	scripts/dummy-tools/
> >>  F:	scripts/include/
> >>  F:	scripts/mk*
> >> diff --git a/scripts/container b/scripts/container
> >> new file mode 100755
> >> index 000000000000..09663eccb8d3
> >> --- /dev/null
> >> +++ b/scripts/container
> >> @@ -0,0 +1,199 @@
> >> +#!/usr/bin/env python3
> >> +# SPDX-License-Identifier: GPL-2.0-only
> >> +# Copyright (C) 2025 Guillaume Tucker
> >> +
> >> +"""Containerized builds"""
> >> +
> >> +import abc
> >> +import argparse
> >> +import logging
> >> +import os
> >> +import pathlib
> >> +import shutil
> >> +import subprocess
> >> +import sys
> >> +import uuid
> >> +
> >> +
> >> +class ContainerRuntime(abc.ABC):
> >> +    """Base class for a container runtime implementation"""
> >> +
> >> +    name =3D None  # Property defined in each implementation class
> >> +
> >> +    def __init__(self, args, logger):
> >> +        self._uid =3D args.uid or os.getuid()
> >> +        self._gid =3D args.gid or args.uid or os.getgid()
> >> +        self._env_file =3D args.env_file
> >> +        self._shell =3D args.shell
> >> +        self._logger =3D logger
> >> +
> >> +    @classmethod
> >> +    def is_present(cls):
> >> +        """Determine whether the runtime is present on the
> >> system"""
> >> +        return shutil.which(cls.name) is not None
> >> +
> >> +    @abc.abstractmethod
> >> +    def _do_run(self, image, cmd, container_name):
> >> +        """Runtime-specific handler to run a command in a
> >> container""" +
> >> +    @abc.abstractmethod
> >> +    def _do_abort(self, container_name):
> >> +        """Runtime-specific handler to abort a running
> >> container""" +
> >> +    def run(self, image, cmd):
> >> +        """Run a command in a runtime container"""
> >> +        container_name =3D str(uuid.uuid4())
> >> +        self._logger.debug("container: %s", container_name)
> >> +        try:
> >> +            return self._do_run(image, cmd, container_name)
> >> +        except KeyboardInterrupt:
> >> +            self._logger.error("user aborted")
> >> +            self._do_abort(container_name)
> >> +            return 1
> >> +
> >> +
> >> +class CommonRuntime(ContainerRuntime):
> >> +    """Common logic for Docker and Podman"""
> >> +
> >> +    def _do_run(self, image, cmd, container_name):
> >> +        cmdline =3D [self.name, 'run']
> >> +        cmdline +=3D self._get_opts(container_name)
> >> +        cmdline.append(image)
> >> +        cmdline +=3D cmd
> >> +        self._logger.debug('command: %s', ' '.join(cmdline))
> >> +        return subprocess.call(cmdline)
> >> +
> >> +    def _get_opts(self, container_name):
> >> +        opts =3D [
> >> +            '--name', container_name,
> >> +            '--rm',
> >> +            '--volume', f'{pathlib.Path.cwd()}:/src',
> >> +            '--workdir', '/src',
> >> +        ]
> >> +        if self._env_file:
> >> +            opts +=3D ['--env-file', self._env_file]
> >> +        if self._shell:
> >> +            opts +=3D ['--interactive', '--tty']
> >> +        return opts
> >> +
> >> +    def _do_abort(self, container_name):
> >> +        subprocess.call([self.name, 'kill', container_name])
> >> +
> >> +
> >> +class DockerRuntime(CommonRuntime):
> >> +    """Run a command in a Docker container"""
> >> +
> >> +    name =3D 'docker'
> >> +
> >> +    def _get_opts(self, container_name):
> >> +        return super()._get_opts(container_name) + [
> >> +            '--user', f'{self._uid}:{self._gid}'
> >> +        ]
> >> +
> >> +
> >> +class PodmanRuntime(CommonRuntime):
> >> +    """Run a command in a Podman container"""
> >> +
> >> +    name =3D 'podman'
> >> +
> >> +    def _get_opts(self, container_name):
> >> +        return super()._get_opts(container_name) + [
> >> +            '--userns',
> >> f'keep-id:uid=3D{self._uid},gid=3D{self._gid}',
> >> +        ]
> >> +
> >> +
> >> +class Runtimes:
> >> +    """List of all supported runtimes"""
> >> +
> >> +    runtimes =3D [PodmanRuntime, DockerRuntime]
> >> +
> >> +    @classmethod
> >> +    def get_names(cls):
> >> +        """Get a list of all the runtime names"""
> >> +        return list(runtime.name for runtime in cls.runtimes)
> >> +
> >> +    @classmethod
> >> +    def get(cls, name):
> >> +        """Get a single runtime class matching the given name"""
> >> +        for runtime in cls.runtimes:
> >> +            if runtime.name =3D=3D name:
> >> +                if not runtime.is_present():
> >> +                    raise ValueError(f"runtime not found: {name}")
> >> +                return runtime
> >> +        raise ValueError(f"unknown runtime: {runtime}")
> >> +
> >=20
> > I think you meant to use "{name}" not "{runtime}" inside ValueError.
>=20
> Ah yes, sorry.  The parser already checks that the runtime name is in
> the list so I've never hit this error.  We would probably need some
> unit tests at some point.
>=20
> So yes this fixes the issue, which can be reproduced with a small
> hack in the script to relax the -r option checks:
>=20
> --- a/scripts/container
> +++ b/scripts/container
> @@ -120,7 +120,7 @@ class Runtimes:
>                  if not runtime.is_present():
>                      raise ValueError(f"runtime not found: {name}")
>                  return runtime
> -        raise ValueError(f"unknown runtime: {runtime}")
> +        raise ValueError(f"unknown runtime: {name}")
> =20
>      @classmethod
>      def find(cls):
>=20
>=20
> Nathan, would you be OK with folding this in or should I send a v5?
>=20
> >> +    @classmethod
> >> +    def find(cls):
> >> +        """Find the first runtime present on the system"""
> >> +        for runtime in cls.runtimes:
> >> +            if runtime.is_present():
> >> +                return runtime
> >> +        raise ValueError("no runtime found")
> >> +
> >=20
> > nit: We could extend the error message like: "Couldn't find any
> > runtime. Use -r <runtime> to specify one manually". What do you
> > think?
>=20
> I'm all for improving the user experience.  It's good to keep the
> implementation logic separate from the command line interface though.
> Maybe this is something I could improve in a follow-up?  There are a
> few other potential things to rework in this area; a more detailed
> error could be logged in main().
>

Sure, sounds good to me.

Thanks,
Onur
=20
> >> +
> >> +def _get_logger(verbose):
> >> +    """Set up a logger with the appropriate level"""
> >> +    logger =3D logging.getLogger('container')
> >> +    handler =3D logging.StreamHandler()
> >> +    handler.setFormatter(logging.Formatter(
> >> +        fmt=3D'[container {levelname}] {message}', style=3D'{'
> >> +    ))
> >> +    logger.addHandler(handler)
> >> +    logger.setLevel(logging.DEBUG if verbose is True else
> >> logging.INFO)
> >> +    return logger
> >> +
> >> +
> >> +def main(args):
> >> +    """Main entry point for the container tool"""
> >> +    logger =3D _get_logger(args.verbose)
> >> +    try:
> >> +        cls =3D Runtimes.get(args.runtime) if args.runtime else
> >> Runtimes.find()
> >> +    except ValueError as ex:
> >> +        logger.error(ex)
> >> +        return 1
> >> +    logger.debug("runtime: %s", cls.name)
> >> +    logger.debug("image: %s", args.image)
> >> +    return cls(args, logger).run(args.image, args.cmd)
> >> +
> >> +
> >> +if __name__ =3D=3D '__main__':
> >> +    parser =3D argparse.ArgumentParser(
> >> +        'container',
> >> +        description=3D"See the documentation for more details: "
> >> +        "https://docs.kernel.org/dev-tools/container.html"
> >> +    )
> >> +    parser.add_argument(
> >> +        '-e', '--env-file',
> >> +        help=3D"Path to an environment file to load in the
> >> container."
> >> +    )
> >> +    parser.add_argument(
> >> +        '-g', '--gid',
> >> +        help=3D"Group ID to use inside the container."
> >> +    )
> >> +    parser.add_argument(
> >> +        '-i', '--image', required=3DTrue,
> >> +        help=3D"Container image name."
> >> +    )
> >> +    parser.add_argument(
> >> +        '-r', '--runtime', choices=3DRuntimes.get_names(),
> >> +        help=3D"Container runtime name.  If not specified, the first
> >> one found "
> >> +        "on the system will be used i.e. Podman if present,
> >> otherwise Docker."
> >> +    )
> >> +    parser.add_argument(
> >> +        '-s', '--shell', action=3D'store_true',
> >> +        help=3D"Run the container in an interactive shell."
> >> +    )
> >> +    parser.add_argument(
> >> +        '-u', '--uid',
> >> +        help=3D"User ID to use inside the container.  If the -g
> >> option is not "
> >> +        "specified, the user ID will also be set as the group ID."
> >> +    )
> >> +    parser.add_argument(
> >> +        '-v', '--verbose', action=3D'store_true',
> >> +        help=3D"Enable verbose output."
> >> +    )
> >> +    parser.add_argument(
> >> +        'cmd', nargs=3D'+',
> >> +        help=3D"Command to run in the container"
> >> +    )
> >> +    sys.exit(main(parser.parse_args(sys.argv[1:])))
> >=20
> > The rest LGTM.
>=20
> Thanks for the reviews.
>=20
> Cheers,
> Guillaume


