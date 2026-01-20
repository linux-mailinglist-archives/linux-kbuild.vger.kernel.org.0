Return-Path: <linux-kbuild+bounces-10730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAstLmIrcGniWwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10730-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 02:26:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BCB4F140
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 02:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7EB1792387C
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 13:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF9C438FEC;
	Tue, 20 Jan 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwDTDqqt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B1921ABBB;
	Tue, 20 Jan 2026 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917312; cv=none; b=gCv1LyUNtw1YdVCsdEr604w4vpyqG7KiPOXRDnG8Ymp3ukOtalQkGm9bhKgpyW5uNXrHjhXZIjO/WzqdvWYyMPkVs3PjqkZMASjbNByy0jRDyQ4VpxgGIQnUUhovQqWBp5iTbFMKPMsE/rSn9aiN5T29S2GwIEKCRzoaGR8zN3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917312; c=relaxed/simple;
	bh=OBHzWftJV/HPuzjp7EqL2/okD1447XonIyvVUXHuPyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXNtkEVdBBqy6q3f21Lo9jg2KU8yfns/FOcvC+eIbL6AlVcDiVaHtZaCReTYOMJC2c9poVsw241abQVB6c14Uw8nv6P4DVOruIEkNoFoGfYgvPSGKepxTKtjxTRFLL1G0ywtIiG0PgG7yQDNCUVQq56/plk+r6ADu6UC6LC3nVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwDTDqqt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65546C16AAE;
	Tue, 20 Jan 2026 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768917309;
	bh=OBHzWftJV/HPuzjp7EqL2/okD1447XonIyvVUXHuPyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gwDTDqqtkwHgeTN6IP41Sqd3KBe8c9lwFp8o9NKhx1kDxhOrC1jJohlLMVmsv88AB
	 ziEOXJeMGY6uBPANYuze1oI9P83VknRsN3GXpTUJhokSWIJeI7Q9j6Rm3J6R7XYh9i
	 lGDceu4UReTscxvb6CmJmxSzD7ZQfXmg7aBh1rLCfLCe3jPcgFJ+CAVZL/HIBONiFc
	 CUOh70KLJBMd+znpVopz62rrKpJFkrXq18UC3cGD0LM9Ecs99BobtjfS08Eylb7XQ2
	 6CR97G/WwQWPHRMIJ4+FOjJdBIWlR8NwIvICBB/uUVy6iuEoM/wa3M1imC6ge0oFZP
	 Nce/uoYXSuZuQ==
Date: Tue, 20 Jan 2026 14:53:33 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 2/2] Documentation: dev-tools: add container.rst page
Message-ID: <aW-I3fNqp_7X0oeg@derry.ads.avm.de>
Mail-Followup-To: Guillaume Tucker <gtucker@gtucker.io>,
	Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
References: <cover.1767199119.git.gtucker@gtucker.io>
 <c859f9b6dd5313136f7a445497d6209405eafa7e.1767199119.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c859f9b6dd5313136f7a445497d6209405eafa7e.1767199119.git.gtucker@gtucker.io>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10730-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,docker.io:url,gtucker.io:email]
X-Rspamd-Queue-Id: 25BCB4F140
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Dec 31, 2025 at 05:51:50PM +0100, Guillaume Tucker wrote:
> Add a dev-tools/container.rst documentation page for the
> scripts/container tool.  This covers the basic usage with additional
> information about environment variables and user IDs.  It also
> includes a number of practical examples with a reference to the
> experimental kernel.org toolchain images.
> 
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: David Gow <davidgow@google.com>
> Cc: "Onur Özkan" <work@onurozkan.dev>
> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
> ---
>  Documentation/dev-tools/container.rst | 201 ++++++++++++++++++++++++++
>  Documentation/dev-tools/index.rst     |   1 +
>  2 files changed, 202 insertions(+)
>  create mode 100644 Documentation/dev-tools/container.rst
> 
> diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
> new file mode 100644
> index 000000000000..f6f134ec09f5
> --- /dev/null
> +++ b/Documentation/dev-tools/container.rst
> @@ -0,0 +1,201 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +.. Copyright (C) 2025 Guillaume Tucker
> +
> +====================
> +Containerized Builds
> +====================
> +
> +The ``container`` tool can be used to run any command in the kernel source tree
> +from within a container.  Doing so facilitates reproducing builds across
> +various platforms, for example when a test bot has reported an issue which
> +requires a specific version of a compiler or an external test suite.  While
> +this can already be done by users who are familiar with containers, having a
> +dedicated tool in the kernel tree lowers the barrier to entry by solving common
> +problems once and for all (e.g. user id management).  It also makes it easier
> +to share an exact command line leading to a particular result.  The main use
> +case is likely to be kernel builds but virtually anything can be run: KUnit,
> +checkpatch etc. provided a suitable image is available.
> +
> +
> +Options
> +=======
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
> +    Container runtime name.  Supported runtimes: ``docker``, ``podman``.
> +
> +    If not specified, the first one found on the system will be used
> +    i.e. Docker if present, otherwise Podman.
> +
> +``-s, --shell``
> +
> +    Run the container in an interactive shell.
> +
> +``-u, --uid UID``
> +
> +    User id to use inside the container.
> +
> +    If the ``-g`` option is not specified, the user id will also be used for
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
> +=====
> +
> +It's entirely up to the user to choose which image to use and the ``CMD``
> +arguments are passed directly as an arbitrary command line to run in the
> +container.  The tool will take care of mounting the source tree as the current
> +working directory and adjust the user and group id as needed.
> +
> +The container image which would typically include a compiler toolchain is
> +provided by the user and selected via the ``-i`` option.  The container runtime
> +can be selected with the ``-r`` option, which can be either ``docker`` or
> +``podman``.  If none is specified, the first one found on the system will be
> +used.  Support for other runtimes may be added later depending on their
> +popularity among users.
> +
> +By default, commands are run non-interactively.  The user can abort a running
> +container with SIGINT (Ctrl-C).  To run commands interactively with a TTY, the
> +``--shell`` or ``-s`` option can be used.  Signals will then be received by the
> +shell directly rather than the parent ``container`` process.  To exit an
> +interactive shell, use Ctrl-D or ``exit``.
> +
> +.. note::
> +
> +   The only host requirement aside from a container runtime is Python 3.10 or
> +   later.
> +
> +
> +Environment Variables
> +=====================
> +
> +Environment variables are not propagated to the container so they have to be
> +either defined in the image itself or via the ``-e`` option using an
> +environment file.  In some cases it makes more sense to have them defined in
> +the Containerfile used to create the image.  For example, a Clang-only compiler
> +toolchain image may have ``LLVM=1`` defined.
> +
> +The local environment file is more useful for user-specific variables added
> +during development.  It is passed as-is to the container runtime so its format
> +may vary.  Typically, it will look like the output of ``env``.  For example::
> +
> +  INSTALL_MOD_STRIP=1
> +  SOME_RANDOM_TEXT=One upon a time
> +
> +Please also note that ``make`` options can still be passed on the command line,
> +so while this can't be done since the first argument needs to be the
> +executable::
> +
> +  scripts/container -i tuxmake/korg-clang LLVM=1 make
> +
> +this will work::
> +
> +  scripts/container -i tuxmake/korg-clang make LLVM=1

First of all: Thanks for all that work!


I probably have just read it over: I have to prefix the
'tuxmake/korg-clang' by 'docker.io/'.  Is that a problem of my system
configuration (Debian forky, no special podman config)?


> +
> +
> +User IDs
> +========
> +
> +This is an area where the behaviour will vary slightly depending on the
> +container runtime.  The goal is to run commands as the user invoking the tool.
> +With Podman, a namespace is created to map the current user id to a different
> +one in the container (1000 by default).  With Docker, while this is also
> +possible with recent versions it requires a special feature to be enabled in
> +the daemon so it's not used here for simplicity.  Instead, the container is run
> +with the current user id directly.  In both cases, this will provide the same
> +file permissions for the kernel source tree mounted as a volume.  The only
> +difference is that when using Docker without a namespace, the user id may not
> +be the same as the default one set in the image.
> +
> +Say, we're using an image which sets up a default user with id 1000 and the
> +current user calling the ``container`` tool has id 1234.  The kernel source
> +tree was checked out by this same user so the files belong to user 1234.  With
> +Podman, the container will be running as user id 1000 with a mapping to id 1234
> +so that the files from the mounted volume appear to belong to id 1000 inside
> +the container.  With Docker and no namespace, the container will be running
> +with user id 1234 which can access the files in the volume but not in the user
> +1000 home directory.  This shouldn't be an issue when running commands only in
> +the kernel tree but it is worth highlighting here as it might matter for
> +special corner cases.

I tested a tiny bit with podman as runtime backend.  If I leave out the
'-r podman' podman's docker emulation is in effect and fails with:

    $ scripts/container -i docker.io/tuxmake/korg-clang -- make LLVM=1 -j8 olddefconfig
    Emulate Docker CLI using podman. Create /etc/containers/nodocker to quiet msg.
    mkdir: cannot create directory '.tmp_15': Permission denied
    mkdir: cannot create directory '.tmp_19': Permission denied
    mkdir: cannot create directory '.tmp_22': Permission denied
    mkdir: cannot create directory '.tmp_25': Permission denied
    mkdir: cannot create directory '.tmp_28': Permission denied
    mkdir: cannot create directory '.tmp_31': Permission denied
      HOSTCC  scripts/basic/fixdep
    error: error opening 'scripts/basic/.fixdep.d': Permission denied
    1 error generated.
    make[2]: *** [scripts/Makefile.host:114: scripts/basic/fixdep] Error 1
    make[1]: *** [/src/Makefile:655: scripts_basic] Error 2
    make: *** [Makefile:248: __sub-make] Error 2
    [exit code 2]

But with '-r podman' it works like a charm.

Would it make sense to switch the default runtime to podman to
prevent non-functional podman-docker emulation?  (Or is this just a
problem on my machine?)

-- 
Nicolas

