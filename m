Return-Path: <linux-kbuild+bounces-13306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGZwEaY7EGrUVAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13306-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 13:19:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB855B2E0E
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 13:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDE12300A123
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 11:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7963D6484;
	Fri, 22 May 2026 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FVxzVeqX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC33CBE97;
	Fri, 22 May 2026 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448738; cv=none; b=k0dEh+dySd4226odvNx9rr4K3Ky33B90ghpQwCFfALRTZJF9T8rNrmTt1UHAm9nMcT7U86B5xX/H+66N91S4t7qF3sJ+CZI13Dc/3CQ3RiyKel+j1naxp3ri4hlu/GOvB0hfC0eyt5KCByuVIZK//5xFjQbfTnYM470no5JTES4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448738; c=relaxed/simple;
	bh=fc9B488bJSTiQB4YXTNKZgtXLNncKFxalF+l+Oo8k6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIYA40L57y9ByaRdATwi+6go/GHk8WJESxFT9TXF98KCjXNRsKgik7a/dTCk/s6UG3Lw0/fNU0y//YhOiB9itsAzfTu2lwNz/z0V2iMTyLwgBI7pbXhkHtB2VRvgjxv/A2kclky05436WjeOia/7/3nZlT1CwssODlNgrL5ip1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FVxzVeqX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175A41F000E9;
	Fri, 22 May 2026 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779448737;
	bh=CV00F1/3qlZOFBlTSTYdLTbuIlGOwKtgVdtS2H4+WQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FVxzVeqXJMsx6ApIrIQPGWHAUsXm1YMJOKhq/jOF6BislQ47ZcQdIcwA/SYGb+gYO
	 e2Q7rqaYNtsuizLpEPMAnCVGydWniWQbdu0ppoW0YpaPuMLADfkwbnqH276Jwf0etq
	 +IkC1s1dBinFyttVJBsfho0vMAB9lau1v7gHfUxI=
Date: Fri, 22 May 2026 13:18:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luis <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	kstewart@linuxfoundation.org, maximilian.huber@tngtech.com
Subject: Re: [PATCH v7 00/15] add SPDX SBOM generation script
Message-ID: <2026052233-task-shifter-4570@gregkh>
References: <20260518062102.2051814-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518062102.2051814-1-luis.augenstein@tngtech.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13306-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: AFB855B2E0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 08:20:47AM +0200, Luis wrote:
> This patch series introduces a Python-based script for generating SBOM
> documents in the SPDX 3.0.1 format for kernel builds.
> 
> A Software Bill of Materials (SBOM) describes the individual components
> of a software product. For the kernel, the goal is to describe the
> distributable build outputs (typically the kernel image and modules),
> the source files involved in producing these outputs, and the build
> process that connects the source and output files.
> 
> To achieve this, the sbom script generates three SPDX documents:
> 
> - sbom-output.spdx.json
>   Describes the final build outputs together with high-level
>   build metadata.
> 
> - sbom-source.spdx.json
>   Describes all source files involved in the build, including
>   licensing information and additional file metadata.
> 
> - sbom-build.spdx.json
>   Describes the entire build process, linking source files
>   from the source SBOM to output files in the output SBOM.
> 
> The sbom script is optional. It can be invoked via the `make sbom` target.
> This target depends on `all` and triggers a standard kernel build. Once all
> output artifacts have been generated, starting from the kernel image and
> modules as root nodes, the script reconstructs the dependency graph up
> to the original source files. Build dependencies are primarily derived from
> the `.cmd` files generated by Kbuild, which record the full command used
> to build each output file.
> 
> Currently, the script only supports x86 and arm64 architectures.
> 
> This series was developed with assistance from AI tools, namely Cursor
> with Claude Sonnet 4.5 and OpenCode with GLM-4.7. The AI was used for
> documentation, exploring the repository, and iterating on design
> questions and implementation details such as regex patterns.
> 
> Assisted-by: Cursor:claude-sonnet-4-5
> Assisted-by: OpenCode:GLM-4-7
> Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>

Now applied to the spdx-linus branch, thanks!

greg k-h

