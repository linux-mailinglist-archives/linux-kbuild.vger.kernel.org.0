Return-Path: <linux-kbuild+bounces-12393-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO6DJBfpy2myMQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12393-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:32:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B736BBA9
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98106302C0DA
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 15:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26902405AA0;
	Tue, 31 Mar 2026 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJKZh7d0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD040758B;
	Tue, 31 Mar 2026 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971015; cv=none; b=qRRsXVAZH+tObQao4ie0GT6J1d8iW8YHDeh0oU3uVuxtdWnEYT1JjyChFvkKhbAeC3pCuBNgn/yIu8CueoAdRlgYw3E0WDrgxb5qqFeZ0Kq7N+fwODja3CFQz6XyyrVp00Umt28RG9MkuHnHB/fjWtJ06xKQ0m6Y7AeMx1drqeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971015; c=relaxed/simple;
	bh=njuWTh8CpT67Wac3qyvqBHHPqTXX9tvwfCgGLkQRVQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihZ2gxCZZHO7HcJGjE1CU8xfJOwDBqRr82DY7BqUcezH22FTRJAh3SnhDJ+ohoeB6BBqkmfT9qeK3GzMgLjUiriJIaqVUlt+TIZgu+QUl9USzxxwyFNdspAE0xjv59nVTiUGvBM5EEDvc0CBsXWQbVos/g9NEIUloiyAmLOWXNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJKZh7d0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2115C19423;
	Tue, 31 Mar 2026 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774971014;
	bh=njuWTh8CpT67Wac3qyvqBHHPqTXX9tvwfCgGLkQRVQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJKZh7d0XYVqo8o89ooUTF3NOTK6mVdCySVMmEX1KPsWrQDHd5+qABSDxJpCCNiRq
	 G3GNF9Kr83xL0NO2fJacdf+X73MMJd3dj3Ub4zLCz1cSf0dOXePLGe5vp6oOQV6JGS
	 Vm2ucFMutdHu+U9k3jfKyYlzVoKtUCVrhIXFFhgK8oitIFUGAiRRRglgSGMcNUPMpG
	 +ggkb3FaY7XMIZpCu/EI3ab967Zm3Pq59na92obc5N3C1PbNOgtYVmawghiKOPDJ6V
	 XRGmfcjTKeTzV3OpEhiStKH38bTVXGcPiKhk0WZTfyp0W+aC9XVz7Ieirh67Qp0cW+
	 rg8OtklTIk32w==
Date: Tue, 31 Mar 2026 17:30:09 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>,
	Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	kstewart@linuxfoundation.org, maximilian.huber@tngtech.com
Subject: Re: [PATCH 02/15] scripts/sbom: integrate script in make process
Message-ID: <20260331153009.GA1103611@ax162>
References: <20260210205424.11195-1-luis.augenstein@tngtech.com>
 <20260210205424.11195-3-luis.augenstein@tngtech.com>
 <20260330095011.GA1458050@ax162>
 <9120907b-9568-4f0e-9757-c9e3b8d530f4@tngtech.com>
 <2026033111-bolt-verse-4505@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026033111-bolt-verse-4505@gregkh>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12393-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C21B736BBA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 07:15:35AM +0200, Greg KH wrote:
> On Mon, Mar 30, 2026 at 10:32:00PM +0200, Luis Augenstein wrote:
> > Hi Nathan,
> > 
> > thanks a lot for your recommendations.
> > 
> > > Does sbom-roots.txt need to be cleaned up as well?
> > 
> > This file is only required to pass the roots into the python script.
> > We could also use a tmp file. Then we don't need to worry about clean
> > up. Together with your other suggested changes something like this
> > should work:
> > 
> > # Script to generate .spdx.json SBOM documents describing the build
> > #
> > ---------------------------------------------------------------------------
> > 
> > ifdef building_out_of_srctree
> > sbom_targets := sbom-source.spdx.json
> > endif
> > sbom_targets += sbom-build.spdx.json sbom-output.spdx.json
> > quiet_cmd_sbom = GEN     $(notdir $(sbom_targets))
> >       cmd_sbom = roots_file=$$(mktemp); \

I think I would rather have a named file in objtree instead of one in
/tmp, as we want all output to remain in the build folder.

> >                  printf "%s\n" "$(KBUILD_IMAGE)" >"$$roots_file"; \
> >                  $(if $(CONFIG_MODULES),sed 's/\.o$$/.ko/'
> > $(objtree)/modules.order >> "$$roots_file";) \
> >                  $(PYTHON3) $(srctree)/scripts/sbom/sbom.py \
> >                      --src-tree $(abspath $(srctree)) \
> >                      --obj-tree $(abspath $(objtree)) \
> >                      --roots-file "$$roots_file" \
> >                      --output-directory $(abspath $(objtree)) \
> >                      --generate-spdx \
> >                      --package-license "GPL-2.0 WITH Linux-syscall-note" \
> >                      --package-version "$(KERNELVERSION)" \
> >                      --write-output-on-error;
> >                  rm -f "$$roots_file"

The cmd macro uses 'set -e', so consider moving this up and making it

    trap  "rm -rf $$roots_file" EXIT; \

like try-run in scripts/Makefile.compiler does to ensure it is always
cleaned up.

> > PHONY += sbom
> > sbom: $(notdir $(KBUILD_IMAGE)) include/generated/autoconf.h $(if
> > $(CONFIG_MODULES),modules modules.order)
> > 	$(call cmd,sbom)
> > 
> > Note, I will also add the --write-output-on-error flag by default such
> > that the .spdx.json documents are generated as much as possible even if
> > some build commands are unknown to the parser.

Seems reasonable to me.

> > > FWIW, I get errors like
> > >
> > >   $ make -kj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- O=build
> > mrproper defconfig sbom
> > >   ...
> > >     GEN     sbom-source.spdx.json sbom-build.spdx.json
> > sbom-output.spdx.json
> > >   [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser.py",
> > line 630, in log_error_or_warning
> > >   Skipped parsing command ccache aarch64-linux-gcc ... -o init/main.o
> > /src/init/main.c because no matching parser was found
> > >   [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser.py",
> > line 630, in log_error_or_warning
> > >   Skipped parsing command ccache aarch64-linux-gcc ... -o
> > arch/arm64/kernel/asm-offsets.s /src/arch/arm64/kernel/asm-offsets.c
> > because no matching parser was found
> > >   [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser.py",
> > line 630, in log_error_or_warning
> > >   Skipped parsing command ccache aarch64-linux-gcc ... -o
> > kernel/bounds.s /src/kernel/bounds.c because no matching parser was found
> > >   ... (Found 10435 more instances of this error)
> > >
> > > when testing the whole series without any modifications, am I doing
> > > something wrong?
> > 
> > I was not aware of ccache. If you rebuild without using ccache the gcc
> > commands should be parsed correctly.
> > 
> > The parser expects gcc commands to be of the form
> > 	"^([^\s]+-)?(gcc|clang)\b"
> > When using tools like ccache this breaks. I will update the parser to
> > look for
> > 	"^(ccache\s+)?([^\s]+-)?(gcc|clang)\b"
> > instead.
> > 
> > Feedback like this is very helpful—thanks! Do you know of any other
> > commonly used tools that modify build commands in a similar way and
> > should be considered?
> 
> Ick, this might get messy as you can modify the compiler with the CC=
> option to be anything.  There are other build tools out there that do
> much the same as ccache does (which I should have caught this as I use
> ccache on my build systems), like distcc and friends, so this might just
> want to look at the result of "CC" instead?

Yeah, it would be much more robust to just look at $(CC) directly if it
is set (i.e., running within Kbuild) vs. having a separate parser like
this. If you want to keep a fallback for standalone usage for
development and such, that's fine, but we should use the information we
have available to be as accurate as possible.

Cheers,
Nathan

