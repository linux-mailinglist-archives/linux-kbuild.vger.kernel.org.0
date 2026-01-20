Return-Path: <linux-kbuild+bounces-10741-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDb4HDGtb2n0EwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10741-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:28:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD744784E
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D939D803E20
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 16:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C56532AAB8;
	Tue, 20 Jan 2026 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wCXTqLLZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1917D32AAAD;
	Tue, 20 Jan 2026 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923630; cv=none; b=k/xVnOME7CQVutrk2j9FW8Q2DTJohbbOhNWWTkNIDd+ZCBx349cKZ6nU+6wA4yMcoQvQdY3R6JJ0iv0IV9sW5udYkBqPfvlh9AVE6QD2zF5FEQI1axwQBFN5/CzhEGjo7FyC1QJOJcVZmUlG9Q5po9Dp6Gx6OkTGQxQN+w2ltc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923630; c=relaxed/simple;
	bh=zxaIXAseCVtYxMGgJS4o/87RKOfQi+T0x5kRdSr4SyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnFSHI6rjdZZbSBRAFJRCFWQzYNmZTCyzANqBiyE1OiMXXkINUgAPqQr0tcpZEB/yC7mfWjbmBvLkYPtButN3L+X7A8tJ26ELC1Hc0orStyXLkvYIVVgZ+AcMX0ZJsHN9t+XGn2W/0dUNt2HOPEp4UD7kuFN9NVt2LCK3mpv3Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wCXTqLLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D82C16AAE;
	Tue, 20 Jan 2026 15:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768923629;
	bh=zxaIXAseCVtYxMGgJS4o/87RKOfQi+T0x5kRdSr4SyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wCXTqLLZW+vHa/WJXSKH0JwDjY8ekiS//lP70u2wrP0vWlhvT33pYomDKIkaUTAMW
	 zWUKhUUGIFv2iKWnkr5kwfgfqnTERibQ3Gqb/7RDbGu7ppb5Ek45d+dQvcj1luBLiD
	 SUwWeiqIoyjODNzYhH5LIVTrN2wJ4/faE+1sIQnY=
Date: Tue, 20 Jan 2026 16:40:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
Message-ID: <2026012035-entail-peddling-7b33@gregkh>
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120115352.10910-1-luis.augenstein@tngtech.com>
X-Spamd-Result: default: False [2.54 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[linuxfoundation.org,none];
	TAGGED_FROM(0.00)[bounces-10741-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 3BD744784E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 12:53:38PM +0100, Luis Augenstein wrote:
> This patch series introduces a Python-based tool for generating SBOM
> documents in the SPDX 3.0.1 format for kernel builds.
> 
> A Software Bill of Materials (SBOM) describes the individual components
> of a software product. For the kernel, the goal is to describe the
> distributable build outputs (typically the kernel image and modules),
> the source files involved in producing these outputs, and the build
> process that connects the source and output files.
> 
> To achieve this, the SBOM tool generates three SPDX documents:
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
> The sbom tool is optional and runs only when CONFIG_SBOM is enabled. It
> is invoked after the build, once all output artifacts have been
> generated. Starting from the kernel image and modules as root nodes,
> the tool reconstructs the dependency graph up to the original source
> files. Build dependencies are primarily derived from the .cmd files
> generated by Kbuild, which record the full command used to build
> each output file.
> 
> Currently, the tool only supports x86 and arm64 architectures.
> 
> Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
> ---
> Changes in v2:
> - regenerate sbom documents when build configuration changes

I'm still getting:

	make[3]: Nothing to be done for 'sbom'.

When rebuilding the kernel and nothing needs to be done for the sbom.
That message should not be there, right?

thanks,

greg k-h

