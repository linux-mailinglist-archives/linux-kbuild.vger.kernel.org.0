Return-Path: <linux-kbuild+bounces-12163-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHi0AxJFwWnpRwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12163-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:50:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 740BE2F34FF
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E554E30A4A15
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 13:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9808438645A;
	Mon, 23 Mar 2026 13:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ea74g6Ji"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC33AE191;
	Mon, 23 Mar 2026 13:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273163; cv=none; b=oziwRY7kPDZK318XRWrR+/XwKpCijBNxSp2eL5a/LxRf7YkhUnUkMXQrfQt/IKzCW6JDqjk7GPcEhGWUf8W+Ak84MOS73rETUK1gYLjmbLgHptnBXAsjAQiDLuvJ0FVUx2l33MJD3fcKuav3pZd3F2s4Xv9S/zrQ8ABF4bb8KEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273163; c=relaxed/simple;
	bh=mXInKepkXxa89oN6MgMt6/fOBTIZvvAg0D9L1njmGPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsXxebBE5MPAtkE8d3k3cyd/cxfXvYzsZlU7BLORlJMX+CnDJ1PG7CaF/6ojbhb3vVAEG9LUf628dITxyF1p3T/Eo6lEYj5GXdHhsEjCmvwF5tV93qAzt6FDj7f1W/o0nkW1NgbInAC/zX5z35/yoerwv+wddhO34jDknI7VYhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ea74g6Ji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4E0C4CEF7;
	Mon, 23 Mar 2026 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774273163;
	bh=mXInKepkXxa89oN6MgMt6/fOBTIZvvAg0D9L1njmGPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ea74g6JihJxFh8kiUX8741z5JeOY6RZ3nYpFf9ivQZnQ+lqUhtJ4qZ3hBhM/VXLuF
	 JUnR5p1wOmByzqVirfu3N6V+gHOIIdXEPEwMvoko4WzecUwH4HkDufPY0I8uCUo0d1
	 Cwl1BiFhM8m/5sJQEC1r6e3429fNObyCh0dsRMAg=
Date: Mon, 23 Mar 2026 14:39:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	kstewart@linuxfoundation.org, maximilian.huber@tngtech.com
Subject: Re: [PATCH v4 00/15] add SPDX SBOM generation script
Message-ID: <2026032343-stoppable-possum-11dc@gregkh>
References: <20260210205424.11195-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210205424.11195-1-luis.augenstein@tngtech.com>
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
	TAGGED_FROM(0.00)[bounces-12163-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email,tngtech.com:email]
X-Rspamd-Queue-Id: 740BE2F34FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Feb 10, 2026 at 09:54:09PM +0100, Luis Augenstein wrote:
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
> Assisted-by: Claude Sonnet 4.5
> Assisted-by: GLM-4.7
> Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

What tree should this go through, the kbuild one?

thanks,

greg k-h

