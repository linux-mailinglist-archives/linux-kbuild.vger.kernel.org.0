Return-Path: <linux-kbuild+bounces-13059-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIgQB4Ze/Gm7OwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13059-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 11:42:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAAF4E62B8
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 11:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 035123003487
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2026 09:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43783BF685;
	Thu,  7 May 2026 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDfUtDwx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197D327BFC;
	Thu,  7 May 2026 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146939; cv=none; b=Vxu3RlyV+MPF/164ZmRKU+9+C8dwjbL6xP2ox8J6ny0MvOZBChK+DTaghfveNBKBT69PG9v1R4k/63tFFrebYcelsWPuLPJJbPLjA0yykPnsQDbKYTFX8nalE+PmIQxLDH13raglrN/zeAH8KZUcmHpAEV14RDkA1GB8otXpjn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146939; c=relaxed/simple;
	bh=cSvOzwebLWWFOxpDg9pVH0S4TNKqBH2Yj6et2+1Xdq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOBB7KIBplaIBwr+DpqkAQFJXkn0ooxJJaRy+poXJrobbiA7Iixk6iD6uoL1K/0UX9cmofuO8fYrEA/UPZ6X/fVnixfjQrjVsVhyMPVhM5ZWRYtPf74oRLxo1iBjzmrdhcQkCsYL6y4AuRKKnsv1M3sxYxJcC1GB0FoTAh1VHhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDfUtDwx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A82C2BCB2;
	Thu,  7 May 2026 09:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778146939;
	bh=cSvOzwebLWWFOxpDg9pVH0S4TNKqBH2Yj6et2+1Xdq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDfUtDwxz63kqz4l3y6JVHGOPAW48Vj8Yx1mwA82l7IKvTv/1J8pyDwrlSWY5o7Io
	 qa9IW136WS9JW+tHvUX06pPOCYGcjanJI3+c4z7U/zsiNP4HJIrA1CZ61RFA6OuoB5
	 /QbULmDNWZtoBHgzprTMk8BuQa9KnwHFiFsDwe3/jxioHe+elEOKAVvmEk8PIzzPfU
	 DexRsHDqxJzL5SnHbLytT1m+XOqVZbq7JO7pDBfUL6bWkai911ULSu1rNgnen+o7oy
	 aWjwDJXtnjewKjsqS/lcoeXTU2Fs0CkMlXejuL21uZgWyy/HWuKcFteswx5uy+AamY
	 BJ3wrLHJveOFA==
Date: Thu, 7 May 2026 17:42:15 +0800
From: Nathan Chancellor <nathan@kernel.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH v5 00/15] add SPDX SBOM generation script
Message-ID: <20260507094215.GB1826581@ax162>
References: <20260410212255.9883-1-luis.augenstein@tngtech.com>
 <177750859587.2042162.11401905742333459790.b4-review@b4>
 <5396a630-9b65-4455-9141-9f3fc520b3ec@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5396a630-9b65-4455-9141-9f3fc520b3ec@tngtech.com>
X-Rspamd-Queue-Id: 1EAAF4E62B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13059-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tngtech.com:email]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 05:18:39PM +0200, Luis Augenstein wrote:
> On 4/30/26 02:23, Nathan Chancellor wrote:
> > On Fri, 10 Apr 2026 23:22:40 +0200, Luis <luis.augenstein@tngtech.com> wrote:
> > > This patch series introduces a Python-based script for generating SBOM
> > > documents in the SPDX 3.0.1 format for kernel builds.
> > 
> > I see the following error when building ARCH=arm64 virtconfig sbom:
> > 
> >    | $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- CROSS_COMPILE_COMPAT=arm-linux-gnueabi- mrproper virtconfig sbom
> >    | [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.py", line 33, in log_error_or_warning
> >    | Skipped parsing command arch/arm64/kernel/vdso32/../../../arm/vdso/vdsomunge arch/arm64/kernel/vdso32/vdso.so.raw arch/arm64/kernel/vdso32/vdso32.so.dbg because no matching parser was found
> >    | ...
> >    | make[3]: *** [/src/Makefile:2184: sbom] Error 1
> >    | ...
> > 
> > I would highly recommend running some randconfig builds with ARCH=arm64
> > and ARCH=x86_64 if you have not already done so to ensure you have
> > caught all corner cases. This one was understandably missed because GCC
> > builds require a separate 32-bit cross compiler (specified with
> > CROSS_COMPILE_COMPAT) to build this code. Testing with LLVM=1 would help
> > with that since the build system handles cross compile automatically in
> > that case.
> 
> So far, I have mainly tested with tinyconfig, defconfig, allmodconfig, and
> the configs from
> https://github.com/gregkh/gregkh-linux/tree/master/stable/configs.
> Additionally, I have now tested some randconfig builds. Still, there will
> most likely be edge cases that we will only discover over time. However,
> while the tool is designed to exit with a non-zero status code when unknown
> commands are encountered, it still produces a valid SBOM based on the
> information it was able to collect. So, despite missing command parser
> errors like these, the tool remains usable.
> There is also the --do-not-fail-on-unknown-build-command option to log
> missing command parser errors as warnings and exit with a zero status code.
> I have disabled this by default, though, to make people more likely to
> report any missing command parser issues they encounter.

Sure. Just be prepared for the bug reports regardless :)

> > > modules as root nodes, the script reconstructs the dependency graph up
> > > to the original source files. Build dependencies are primarily derived from
> > > the `.cmd` files generated by Kbuild, which record the full command used
> > > to build each output file.
> > > 
> > > Currently, the script only supports x86 and arm64 architectures.
> > 
> > This does not appear to be codified anywhere? I can run the sbom target
> > when targeting ARCH=arm for example, resulting in:
> > 
> >    | [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.py", line 33, in log_error_or_warning
> >    | Skipped parsing command sh /src/arch/arm/tools/syscallnr.sh /src/arch/arm/tools/syscall.tbl arch/arm/include/generated/asm/unistd-nr.h because no matching parser was found
> >    | [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.py", line 33, in log_error_or_warning
> >    | Skipped parsing command ./arch/arm/vdso/vdsomunge arch/arm/vdso/vdso.so.raw arch/arm/vdso/vdso.so.dbg because no matching parser was found
> >    | [WARNING] Could not infer primary purpose for /src/arch/arm/tools/mach-types
> >    | [WARNING] Could not infer primary purpose for /build/arch/arm/boot/compressed/piggy_data
> 
> Yes, this is not codified in the sense that the tool does not restrict
> execution to specific architectures.
> Should it?
> As stated above, the tool is designed to collect as much of the dependency
> graph as possible. For other architectures, it behaves the same way, i.e., a
> valid SBOM is produced, but the missing parser errors indicate that the SBOM
> is not complete. I think this behavior is more useful than denying execution
> for other architectures entirely, but we could change that if you think
> otherwise.

I don't really care one way or another. I merely pointed it out since
there seems to be some low hanging fruit there but it may be worth
waiting to see who would use this with those various architectures
before working on supporting those commands.

-- 
Cheers,
Nathan

