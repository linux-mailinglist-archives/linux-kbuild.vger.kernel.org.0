Return-Path: <linux-kbuild+bounces-11489-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNkdDYWbomlI4QQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11489-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 08:38:45 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EDC1C12D6
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 08:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B7893137B4F
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 07:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC2C36E49E;
	Sat, 28 Feb 2026 07:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJhCkYNn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872E736E469;
	Sat, 28 Feb 2026 07:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772263952; cv=none; b=uxlchi79vyhqb6rnpNmB6VLzfsoeKHq2A7k191KgyGV89klrSdz9m/6JHRRbyc9cdmVcLMfrKT/Psu8B3jGVHflwwcWMwk3ngBmWWENiv1i5luHIChgt5fKjWjmbPstSvhpzi7Xgf7uVBcmql3xMpZRMIKDo3nWFQCFPf90b2js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772263952; c=relaxed/simple;
	bh=qrYnmCmK9ecDjldrZg/E18K++9YC+yD59j5tWn/Bmaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYzlKprypGSlVXJUKEkWUQjRwnL1C26qr1LKNSYNXpTVjHw3RmE/Oy+egjkP6YrPcaiHL9VrozypFReJc0kHkYJ0qTtMrjJ0sMcFRJLCRNWfvMEAHElpde8kn4HJTCDO+T37tgJsTqq+cN1wgNXWhcSLWcpnCCu9z2Qx/AIVA60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJhCkYNn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F0EC116D0;
	Sat, 28 Feb 2026 07:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772263952;
	bh=qrYnmCmK9ecDjldrZg/E18K++9YC+yD59j5tWn/Bmaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NJhCkYNnbUfgVQ+CH2gRCUK/z1ux3q+CpLfaewltLQgZUlyAc+TwmG+FL70/ez9r+
	 xlvxWSz8U+r73ktc/RM1YmzQ1F3BjzzEooBRccVeqTcqB1gJguiv35ZVElb/TQgHiE
	 1/yb2znP6l/lNcxI3qrpzxntmigq9MNf3fcoUtRUwVN8KbW2BlAo09ag7R78RYUM+U
	 g9LS15VDjG7CX+kw39ZMRAGZva60cB5GbwDcL7fJRmNWehhelVCp5Ih/uvryh4Fu3T
	 GojWSO4efr67xq2DWn3q8iPTj7X2mG8FBeKdR8K58Wl63R3ULtMuORxckXsE1QY8cY
	 rOdfL7XklFzQw==
Date: Sat, 28 Feb 2026 08:27:06 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Michal Suchanek <msuchanek@suse.de>,
	Rainer Fiebig <jrf@mailbox.org>
Subject: Re: [PATCH] kbuild: Leave objtool binary around with 'make clean'
Message-ID: <aaKYys24qkqTrDcy@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Michal Suchanek <msuchanek@suse.de>,
	Rainer Fiebig <jrf@mailbox.org>
References: <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11489-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 88EDC1C12D6
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:40:48PM -0700, Nathan Chancellor wrote:
> The difference between 'make clean' and 'make mrproper' is documented in
> 'make help' as:
> 
>   clean     - Remove most generated files but keep the config and
>               enough build support to build external modules
>   mrproper  - Remove all generated files + config + various backup files
> 
> After commit 68b4fe32d737 ("kbuild: Add objtool to top-level clean
> target"), running 'make clean' then attempting to build an external
> module with the resulting build directory fails with
> 
>   $ make ARCH=x86_64 O=build clean
> 
>   $ make -C build M=... MO=...
>   ...
>   /bin/sh: line 1: .../build/tools/objtool/objtool: No such file or directory
> 
> as 'make clean' removes the objtool binary.
> 
> Split the objtool clean target into mrproper and clean like Kbuild does
> and remove all generated artifacts with 'make clean' except for the
> objtool binary, which is removed with 'make mrproper'.
> 
> Cc: stable@vger.kernel.org
> Fixes: 68b4fe32d737 ("kbuild: Add objtool to top-level clean target")
> Reported-by: Michal Suchanek <msuchanek@suse.de>
> Closes: https://lore.kernel.org/20260225112633.6123-1-msuchanek@suse.de/
> Reported-by: Rainer Fiebig <jrf@mailbox.org>
> Closes: https://lore.kernel.org/62d12399-76e5-3d40-126a-7490b4795b17@mailbox.org/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I realize that this will technically decend into tools/objtool twice
> during cleaning when running mrproper but I don't think it is the end of
> the world for a much simpler implementation.

Yes, I think that should be ok.

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>


-- 
Nicolas

