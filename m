Return-Path: <linux-kbuild+bounces-10731-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPg9GuIecGlRVwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10731-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 01:33:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD3D4E8B7
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 01:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8AE0D923BA0
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 13:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9A143900C;
	Tue, 20 Jan 2026 13:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAruJHew"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51C42980D;
	Tue, 20 Jan 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917313; cv=none; b=t+M0t8dXuokLzYyOUteottsfLbxMB2eQaaBJZA5sYlZtnn83BkpbwWdBdNgG4v2PPzbZBoZ4ZhxA4Zjz4UqKCZ8Um0RkK1AJAflGF2FxFVYSehJC08iXkL6GfK0OKQh/D3NSeivhlbmrZl+T5vgUIU9/5bJJzysXeGNPgke9hHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917313; c=relaxed/simple;
	bh=PjUrq5cWtFbXMjc2NQa42ZtqpF3yt0CzwHVTrsX+g20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtJeWDKqIyAl6gvy4925kiyX0KuTwDEDZYac93semCYYCNlWAZiMmMAU3QUsjBCWGfEk5eDl29dMM/wtX7y4Q/rhk8VaXoHgFQcWBXxaTY/N3HKRgrdU/1LhIDf809OT67ny2I8j0NAqHt1YZapPdBMAxqjsI2jZmuorc7RM9tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAruJHew; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63EB0C19422;
	Tue, 20 Jan 2026 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768917312;
	bh=PjUrq5cWtFbXMjc2NQa42ZtqpF3yt0CzwHVTrsX+g20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAruJHew5WAvdT2fMAkD4tprZTxGpGVlg4fZ6VM6EfG6NgKAe+6w6dhKc5yYTDJMG
	 AhRO+iY7shNn9Mnltsas2VT1z5/DS5p2wTpkcDef4hHBduNzcJCIDWdYXpS5VGU4sh
	 Ofp/WzbN5v3cliWSW/VwZmN/WoS1RXiJciB1HrRgpz48jio9yHg2w8cWH15/YiK95y
	 KFQ7MqOfZNcprjnTmGBjVWYGjRbNEh/YsazMuTHhmVEsN4UeZs4FXSNXEb7L7ghpJo
	 PEJvgsu4hLU0PtGHlYCaKbDTM2XHdVHITS/tWVxr7fI1HGAe+PEZE1T08erKr82NCj
	 HdDeiM7QSUdWg==
Date: Tue, 20 Jan 2026 14:54:47 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
Message-ID: <aW-JJ5DT-LRSZkdF@derry.ads.avm.de>
Mail-Followup-To: Guillaume Tucker <gtucker@gtucker.io>,
	Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
References: <cover.1767199119.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1767199119.git.gtucker@gtucker.io>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10731-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,derry.ads.avm.de:mid,gitlab.com:url]
X-Rspamd-Queue-Id: CCD3D4E8B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Dec 31, 2025 at 05:51:48PM +0100, Guillaume Tucker wrote:
> This proposal emerged from discussions over email and after a talk at
> Plumbers 2024:
> 
>     https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
> 
> The aim is to facilitate reproducing builds for CI bots as well as
> developers using containers.  Here's an illustrative example with a
> kernel.org toolchain in a Docker image from tuxmake:
> 
>     $ scripts/container -i tuxmake/korg-clang-21 make LLVM=1 defconfig
>       HOSTCC  scripts/basic/fixdep
>       HOSTCC  scripts/kconfig/conf.o
>     [...]
>       HOSTCC  scripts/kconfig/util.o
>       HOSTLD  scripts/kconfig/conf
>     *** Default configuration is based on 'x86_64_defconfig'
>     #
>     # configuration written to .config
>     #
> 
> This patch series also includes a documentation page with all the
> relevant details and further examples about how to use the tool.
> 
> To go one step further, I'm in the process of preparing reference
> container images with kernel.org toolchains and no third-party
> dependencies other than the base Debian distro.  See this thread for
> more details and options to host them in an upstream way:
> 
>     https://lore.kernel.org/all/cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io/
> 
> Say, to run KUnit using the latest kernel.org GCC toolchain:
> 
>     scripts/container --shell \
>         -i registry.gitlab.com/gtucker/korg-containers/gcc:kunit -- \
>         tools/testing/kunit/kunit.py \
>             run \
>             --arch=x86_64 \
>             --cross_compile=x86_64-linux-
> 
> ---
> Changes in v3:
> - Refactor common code for Docker and Podman
> - Add docs.kernel.org URL in help message
> - Use pathlib Python package
> - Handle signals in parent process by default
> - Add --shell option to use an interactive shell
> - Tweak debug messages in verbose mode
> - Specify Python 3.10 as minimum version in the docs
> - Provide an example env file in the docs
> - Update docs regarding interactive shell usage
> 
> Changes in v2:
> - Drop default image but make -i option required
> - Look for Docker and Podman if no runtime specified
> - Catch SIGINT from user to abort container with Docker
> - Explicitly name each container with a UUID
> - Update documentation accordingly
> 
> ---
> 
> Guillaume Tucker (2):
>   scripts: add tool to run containerized builds
>   Documentation: dev-tools: add container.rst page
> 
>  Documentation/dev-tools/container.rst | 201 ++++++++++++++++++++++++++
>  Documentation/dev-tools/index.rst     |   1 +
>  scripts/container                     | 199 +++++++++++++++++++++++++
>  3 files changed, 401 insertions(+)
>  create mode 100644 Documentation/dev-tools/container.rst
>  create mode 100755 scripts/container
> 
> -- 
> 2.47.3
> 
> 

Out-of-source builds do not work on my system with podman.  If this is
expected, I think it would be great to mention that somewhere in the
documentation.


Nevertheless, thanks a lot!  I expect me to use that a lot in the
future!

For the whole patch set:
Tested-by: Nicolas Schier <nsc@kernel.org>
Acked-by: Nicolas Schier <nsc@kernel.org>

Kind regards,
Nicolas


-- 
Nicolas

