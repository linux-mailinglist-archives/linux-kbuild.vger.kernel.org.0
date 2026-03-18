Return-Path: <linux-kbuild+bounces-12070-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP5TEKkDu2kdeQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12070-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 20:57:29 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B53212C2442
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 20:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 812C230217DE
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 19:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57D73F7A92;
	Wed, 18 Mar 2026 19:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPA3lDa2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820DF3F54DD;
	Wed, 18 Mar 2026 19:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773863837; cv=none; b=Rkw/+wzepqRouD5VQy9I42hnFrBDYCdY4ZPZXfz1m5hZ0hcZA34xJkYI1F/oq3ABbZnh9a25Y9MM4lLXOu3y7VlK/J56iIhOhYnjc2C55nxYQgPMWr8Z1/drScx1gMnjtseu/9BPxLTpatYyd4V8Q5F7TMD6MpoD5CoI67MszRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773863837; c=relaxed/simple;
	bh=FE2ttuvV+KBb44hFRvqmh0FjK3w624gREPleu9qGu4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1ceFa5L0U4n8woJ+ALo3TspfGLExws/izeQ4vGj2ut+SId9OJDypuEuZ2+DRSCyo+qD0SIrIQ3VzR2DfZyELVRWcPa42E6agGCDheqhUnetGq1wfM7msMa8n8LbmhrCam2O3X2n536EEa+sv7Ej58c+WNZT947hrbIprfWirfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPA3lDa2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BCDC2BCAF;
	Wed, 18 Mar 2026 19:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773863837;
	bh=FE2ttuvV+KBb44hFRvqmh0FjK3w624gREPleu9qGu4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPA3lDa25LYpMQlNVSQE7creOvrQaav7OfPs8GWdjcrcKMQhr6VYqEaOekX5MKXSL
	 jSvDTGiY+jvipCaXAAfF1Hkfmni2l+dCpaK3QlMs43T9U4DfE+hMtj7G+joJPy4dIf
	 dL1u5WJVx3bnpUoSGCjnNCHKnjSrTAbwofsWMHnRrf8O43Ere6llSHcjtxeWwjPyNE
	 iEG623GXDkKrdfm4lnBOY94/Y4Xs/bFMmKueZa/8pJN8rQtML+TFCHzC0L3nJ1hUD/
	 CUnpwTa+eQ0OhOd5KHbjFpEW9hbzPJZyRuqH7013XRjyVbEW6hLEqkLXjFyg2saNzX
	 D/5DSLR7rG/VQ==
Date: Wed, 18 Mar 2026 20:56:50 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Oli <oochiolio@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-input@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] Remove unused headers in x86/tools, scripts, pps, input
Message-ID: <absDgpUDubJvDbEy@derry.ads.avm.de>
References: <CAOW84UxjnSDKSjsaaS9=DBquCk3SDfb74=OmkHTLUyq5qriYsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOW84UxjnSDKSjsaaS9=DBquCk3SDfb74=OmkHTLUyq5qriYsA@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12070-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,goodmis.org,efficios.com,enneenne.com,bitmath.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,derry.ads.avm.de:mid,addre.ss:email]
X-Rspamd-Queue-Id: B53212C2442
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oli,

thanks for your contribution.  Some comments below:

On Tue, Mar 10, 2026 at 10:01:41PM -0500, Oli wrote:
> From c78a0572f5ec2b927f9b723af687e6ef913561a4 Mon Sep 17 00:00:00 2001
> From: Eddie Hudgins <Oochiolio@gmail.com>
> Date: Tue, 10 Mar 2026 21:53:07 -0500
> Subject: [PATCH] Signed-off-by: Eddie Hudgins <Oochiolio@gmail.com>
>  arch/x86/tools: Removed headers in relocs_32.c scripts/basic: Removed
> headers
>  in fixdep.c drivers/pps: Removed headers in pps.c drivers/input: Removed
>  headers in input-mt.c

Usually, patch mails do not contain mail headers within their body; the
only possible exception is 'From:' if the sender is not the patch
author.  These additional headers prevent the usual patch application
(e.g. 'git am <mail').

> 
> These changes compile for x86, x86_64, and powerpc (Those were the only
> ones fairly tested) under defconfig. This aims to clean up code and
> simplify the files for developers. This will also contribute to start of
> decluttering the environment.

A commit subject should start with a subsystem identifier.  A commit
message should tell about the what and why of the patch, followed by a
'Signed-of-by'.  E.g.:

   kbuild: fixdep: Remove unused includes

   Remove unused #include statements for clean up.

   Signed-off-by: Your Name <your.e.mail@addre.ss>

(More complex changes require more details commit message).

Please check Documentation/process/submitting-patches.rst.

[...]
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index cdd5da7e009b..feb9e7d8984d 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -89,7 +89,6 @@
>   *  but I don't think the added complexity is worth it)
>   */
> 
> -#include <sys/types.h>
>  #include <sys/stat.h>
>  #include <unistd.h>
>  #include <fcntl.h>
> --
> 2.43.0

The change in scripts/basic/fixdep.c looks good to me.  Do you want to
prepare a new kbuild-only patch and want me to take it for kbuild?

Kind regards,
Nicolas

