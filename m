Return-Path: <linux-kbuild+bounces-10811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GARvEIdIcmnpfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10811-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:55:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E5694D1
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B94F6ACA2F
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 14:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975C734FF75;
	Thu, 22 Jan 2026 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="RHq+QD8i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward502a.mail.yandex.net (forward502a.mail.yandex.net [178.154.239.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DB42236EB;
	Thu, 22 Jan 2026 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093851; cv=none; b=PrNDoth7kXiAOOLArgxdrOx8g2rXchL+iENA+o6f4zn4lQPyiaM6vlFwDwonWfNTx77D+gQh9NSisK3pkXJrSjzTb2iqAz+lE4T5IKtfe+oG9sdVd/Ok1JaUaRLa7ejV9uF8EN9PbkX4YJNOlKyi6nK5xvsDfoevAQV+jf2qAdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093851; c=relaxed/simple;
	bh=MJwLJHjgwHoJujqhIoO1zvO/1s5pjRRQpB/ryBDNq60=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKM5RgetR5POENBDY1hkDQVycZzrrfEDzYGr2sB5P4pEMjzrR3pO2gAbQ+fhVQl0+PluIoGS4QSFh+0L5X5dGjI6O+LCMQDIRv2rn7Kfv8Q8C7eDbc8Z5RN3Y8la7ErY8/cbPB57ojE2zeLX5JSZcuTfHxuvvYatls9hYZt4r5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=RHq+QD8i; arc=none smtp.client-ip=178.154.239.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:c02d:0:640:f30a:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTPS id 9A98C8A315;
	Thu, 22 Jan 2026 17:22:52 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id mMdmTPYGmqM0-ERNeZI8f;
	Thu, 22 Jan 2026 17:22:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1769091771;
	bh=MBhIWBUY2/5EYJTgIE3lTIPYG+tFnJnPo7Rk4jlv5pg=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=RHq+QD8i+W6C2Il8rVGNDi7S5cXCSrdQVC1zXucZyvGroae6b80JdiwucoR55sOzh
	 kKu7+KgpGJW7T7JxeyU4RRFhFReTOQO9HnNdU/WOAd7inO1xCn2LwyjP40xUqvyDbN
	 F53TvzVE510Pek3GzU/n+UWgUrwI+8Rq9CHwChS8=
Authentication-Results: mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 22 Jan 2026 17:22:45 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>, Arnd
 Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v4 2/2] Documentation: dev-tools: add container.rst page
Message-ID: <20260122172245.04a1fbe4@nimda>
In-Reply-To: <af886533cc5cbdd6ef1d909793b79a1ad42c74ca.1769090419.git.gtucker@gtucker.io>
References: <cover.1769090419.git.gtucker@gtucker.io>
	<af886533cc5cbdd6ef1d909793b79a1ad42c74ca.1769090419.git.gtucker@gtucker.io>
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
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-10811-lists,linux-kbuild=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[onurozkan.dev,reject];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[docker.io:url,gitlab.com:url,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,podman-desktop.io:url,gtucker.io:email,onurozkan.dev:email,onurozkan.dev:dkim]
X-Rspamd-Queue-Id: D44E5694D1
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 15:07:00 +0100
Guillaume Tucker <gtucker@gtucker.io> wrote:

> Add a dev-tools/container.rst documentation page for the
> scripts/container tool.  This covers the basic usage with additional
> information about environment variables and user IDs.  It also
> includes a number of practical examples with a reference to the
> experimental kernel.org toolchain images.
>=20
> Update MAINTAINERS accordingly with a reference to the added file.
>=20
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nsc@kernel.org>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: David Gow <davidgow@google.com>
> Cc: "Onur =C3=96zkan" <work@onurozkan.dev>
> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
> ---
>  Documentation/dev-tools/container.rst | 227
> ++++++++++++++++++++++++++ Documentation/dev-tools/index.rst     |
> 1 + MAINTAINERS                           |   1 +
>  3 files changed, 229 insertions(+)
>  create mode 100644 Documentation/dev-tools/container.rst
>=20
> diff --git a/Documentation/dev-tools/container.rst
> b/Documentation/dev-tools/container.rst new file mode 100644
> index 000000000000..452415b64662
> --- /dev/null
> +++ b/Documentation/dev-tools/container.rst
> @@ -0,0 +1,227 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +.. Copyright (C) 2025 Guillaume Tucker
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Containerized Builds
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The ``container`` tool can be used to run any command in the kernel
> source tree +from within a container.  Doing so facilitates
> reproducing builds across +various platforms, for example when a test
> bot has reported an issue which +requires a specific version of a
> compiler or an external test suite.  While +this can already be done
> by users who are familiar with containers, having a +dedicated tool
> in the kernel tree lowers the barrier to entry by solving common
> +problems once and for all (e.g. user id management).  It also makes
> it easier +to share an exact command line leading to a particular
> result.  The main use +case is likely to be kernel builds but
> virtually anything can be run: KUnit, +checkpatch etc. provided a
> suitable image is available. + +
> +Options
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +Command line syntax::
> +
> +  scripts/container -i IMAGE [OPTION]... CMD...
> +
> +Available options:
> +
> +``-e, --env-file ENV_FILE``
> +
> +    Path to an environment file to load in the container.
> +
> +``-g, --gid GID``
> +
> +    Group id to use inside the container.
> +
> +``-i, --image IMAGE``
> +
> +    Container image name (required).
> +
> +``-r, --runtime RUNTIME``
> +
> +    Container runtime name.  Supported runtimes: ``docker``,
> ``podman``. +
> +    If not specified, the first one found on the system will be used
> +    i.e. Podman if present, otherwise Docker.
> +
> +``-s, --shell``
> +
> +    Run the container in an interactive shell.
> +
> +``-u, --uid UID``
> +
> +    User id to use inside the container.
> +
> +    If the ``-g`` option is not specified, the user id will also be
> used for
> +    the group id.
> +
> +``-v, --verbose``
> +
> +    Enable verbose output.
> +
> +``-h, --help``
> +
> +    Show the help message and exit.
> +
> +
> +Usage
> +=3D=3D=3D=3D=3D
> +
> +It's entirely up to the user to choose which image to use and the
> ``CMD`` +arguments are passed directly as an arbitrary command line
> to run in the +container.  The tool will take care of mounting the
> source tree as the current +working directory and adjust the user and
> group id as needed. +
> +The container image which would typically include a compiler
> toolchain is +provided by the user and selected via the ``-i``
> option.  The container runtime +can be selected with the ``-r``
> option, which can be either ``docker`` or +``podman``.  If none is
> specified, the first one found on the system will be +used while
> giving priority to Podman.  Support for other runtimes may be added
> +later depending on their popularity among users. +
> +By default, commands are run non-interactively.  The user can abort
> a running +container with SIGINT (Ctrl-C).  To run commands
> interactively with a TTY, the +``--shell`` or ``-s`` option can be
> used.  Signals will then be received by the +shell directly rather
> than the parent ``container`` process.  To exit an +interactive
> shell, use Ctrl-D or ``exit``. +
> +.. note::
> +
> +   The only host requirement aside from a container runtime is
> Python 3.10 or
> +   later.
> +
> +.. note::
> +
> +   Out-of-tree builds are not fully supported yet.  The ``O=3D``
> option can
> +   however already be used with a relative path inside the source
> tree to keep
> +   separate build outputs.  A workaround to build outside the tree
> is to use
> +   ``mount --bind``, see the examples section further down.
> +
> +
> +Environment Variables
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Environment variables are not propagated to the container so they
> have to be +either defined in the image itself or via the ``-e``
> option using an +environment file.  In some cases it makes more sense
> to have them defined in +the Containerfile used to create the image.
> For example, a Clang-only compiler +toolchain image may have
> ``LLVM=3D1`` defined. +
> +The local environment file is more useful for user-specific
> variables added +during development.  It is passed as-is to the
> container runtime so its format +may vary.  Typically, it will look
> like the output of ``env``.  For example:: +
> +  INSTALL_MOD_STRIP=3D1
> +  SOME_RANDOM_TEXT=3DOne upon a time
> +
> +Please also note that ``make`` options can still be passed on the
> command line, +so while this can't be done since the first argument
> needs to be the +executable::
> +
> +  scripts/container -i docker.io/tuxmake/korg-clang LLVM=3D1 make  #
> won't work +
> +this will work::
> +
> +  scripts/container -i docker.io/tuxmake/korg-clang make LLVM=3D1
> +
> +
> +User IDs
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This is an area where the behaviour will vary slightly depending on
> the +container runtime.  The goal is to run commands as the user
> invoking the tool. +With Podman, a namespace is created to map the
> current user id to a different +one in the container (1000 by
> default).  With Docker, while this is also +possible with recent
> versions it requires a special feature to be enabled in +the daemon
> so it's not used here for simplicity.  Instead, the container is run
> +with the current user id directly.  In both cases, this will provide
> the same +file permissions for the kernel source tree mounted as a
> volume.  The only +difference is that when using Docker without a
> namespace, the user id may not +be the same as the default one set in
> the image. + +Say, we're using an image which sets up a default user
> with id 1000 and the +current user calling the ``container`` tool has
> id 1234.  The kernel source +tree was checked out by this same user
> so the files belong to user 1234.  With +Podman, the container will
> be running as user id 1000 with a mapping to id 1234 +so that the
> files from the mounted volume appear to belong to id 1000 inside +the
> container.  With Docker and no namespace, the container will be
> running +with user id 1234 which can access the files in the volume
> but not in the user +1000 home directory.  This shouldn't be an issue
> when running commands only in +the kernel tree but it is worth
> highlighting here as it might matter for +special corner cases. +
> +.. note::
> +
> +   Podman's `Docker compatibility
> +
> <https://podman-desktop.io/docs/migrating-from-docker/managing-docker-com=
patibility>`__
> +   mode to run ``docker`` commands on top of a Podman backend is
> more complex
> +   and not fully supported yet.  As such, Podman will take priority
> if both
> +   runtimes are available on the system.
> +
> +
> +Examples
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The TuxMake project provides a variety of prebuilt container images
> available +on `Docker Hub <https://hub.docker.com/u/tuxmake>`__.
> Here's the shortest +example to build a kernel using a TuxMake Clang
> image:: +
> +  scripts/container -i docker.io/tuxmake/korg-clang -- make LLVM=3D1
> defconfig
> +  scripts/container -i docker.io/tuxmake/korg-clang -- make LLVM=3D1
> -j$(nproc) +
> +.. note::
> +
> +   When running a command with options within the container, it
> should be
> +   separated with a double dash ``--`` to not confuse them with the
> +   ``container`` tool options.  Plain commands with no options don't
> strictly
> +   require the double dashes e.g.::
> +
> +     scripts/container -i docker.io/tuxmake/korg-clang make mrproper
> +
> +To run ``checkpatch.pl`` in a ``patches`` directory with a generic
> Perl image:: +
> +  scripts/container -i perl:slim-trixie scripts/checkpatch.pl
> patches/* +
> +As an alternative to the TuxMake images, the examples below refer to
> +``kernel.org`` images which are based on the `kernel.org compiler
> toolchains +<https://mirrors.edge.kernel.org/pub/tools/>`__.  These
> aren't (yet) officially +available in any public registry but users
> can build their own locally instead +using this `experimental
> repository +<https://gitlab.com/gtucker/korg-containers>`__ by
> running ``make +PREFIX=3Dkernel.org/``.
> +
> +To build just ``bzImage`` using Clang::
> +
> +  scripts/container -i kernel.org/clang -- make bzImage -j$(nproc)
> +
> +Same with GCC 15 as a particular version tag::
> +
> +  scripts/container -i kernel.org/gcc:15 -- make bzImage -j$(nproc)
> +
> +For an out-of-tree build, a trick is to bind-mount the destination
> directory to +a relative path inside the source tree::
> +
> +  mkdir -p $HOME/tmp/my-kernel-build
> +  mkdir -p build
> +  sudo mount --bind $HOME/tmp/my-kernel-build build
> +  scripts/container -i kernel.org/gcc -- make mrproper
> +  scripts/container -i kernel.org/gcc -- make O=3Dbuild defconfig
> +  scripts/container -i kernel.org/gcc -- make O=3Dbuild -j$(nproc)
> +
> +To run KUnit in an interactive shell and get the full output::
> +
> +  scripts/container -s -i kernel.org/gcc:kunit -- \
> +      tools/testing/kunit/kunit.py \
> +          run \
> +          --arch=3Dx86_64 \
> +          --cross_compile=3Dx86_64-linux-
> +
> +To just start an interactive shell::
> +
> +  scripts/container -si kernel.org/gcc bash
> +
> +To build the HTML documentation, which requires the ``kdocs`` image
> built with +``make PREFIX=3Dkernel.org/ extra`` as it's not a compiler
> toolchain:: +
> +  scripts/container -i kernel.org/kdocs make htmldocs
> diff --git a/Documentation/dev-tools/index.rst
> b/Documentation/dev-tools/index.rst index 4b8425e348ab..527a0e4cf2ed
> 100644 --- a/Documentation/dev-tools/index.rst
> +++ b/Documentation/dev-tools/index.rst
> @@ -38,6 +38,7 @@ Documentation/process/debugging/index.rst
>     gpio-sloppy-logic-analyzer
>     autofdo
>     propeller
> +   container
> =20
> =20
>  .. only::  subproject and html
> diff --git a/MAINTAINERS b/MAINTAINERS
> index affd55ff05e0..4e82dba3bd25 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6387,6 +6387,7 @@ F:	include/linux/console*
>  CONTAINER BUILD SCRIPT
>  M:	Guillaume Tucker <gtucker@gtucker.io>
>  S:	Maintained
> +F:	Documentation/dev-tools/container.rst
>  F:	scripts/container
> =20
>  CONTEXT TRACKING

This looks great.

Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>

