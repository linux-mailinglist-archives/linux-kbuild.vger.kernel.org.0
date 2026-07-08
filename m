Return-Path: <linux-kbuild+bounces-13955-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n1prAjKcTmqBQgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13955-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 20:51:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB965729B85
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 20:51:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RSa5Ntle;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13955-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13955-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C6E03001856
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2026 18:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB893C3787;
	Wed,  8 Jul 2026 18:48:21 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44793C1405;
	Wed,  8 Jul 2026 18:48:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783536501; cv=none; b=q/xxRKlfOw63srPkKOaxUaQj6ykF+pDM2zIOsGx0EeNiiDuSfzhRav8L5wpIZ99yBz8hr1pTwWtL9+vo1misbRhSd9R8lubL1H+R2rwV13P0/DFeus3TTtYxl5GEg6uSbABdofWBKyb+2qAbLIsaTc2r52UY9QI3pd02kY6KRss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783536501; c=relaxed/simple;
	bh=xTE3XqYTfINIssc2CaGaZj1Y4924DZBPxUecejZaaNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maChV+n7totH9pSLYzehuqDEN2GV+TzAPd9dLtKrv6W1fAFp+0uEHvrBJxtH/gsxJkyp62YP0OYEl3LmpDvLWiHB4pyLAMPmSx95yDF95B0RJTSHlDdrOWFQoIa0zLPgcCh7OCwRvfdf6HFI2DKNlcn4HnxdF2qZhM0mJ0xdzFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSa5Ntle; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C6EF41F000E9;
	Wed,  8 Jul 2026 18:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783536500;
	bh=1ZTYGO6NCYK29slkINuRzA2vxAhobqzKFaRG2ccss9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RSa5NtleDkabCKvhbPSvESEy2SVYz8gyU4h+v5MmiICU4YdQeFdwmvB/wNBlEJpSs
	 dxPH++kyvXnAmSOLYOVvzZG/Z/wgRxhwQ8geF9Ykyvi9Hab9+nW/MyKPpaPciO1ov3
	 Y//DGPYBgah76SLXOM0a7mxzu8E8VADqJ6GagaQEKewxVTbjyeCeqJFnylJXSSs3o+
	 YHYPpGYdv0ENXdhGxhbAWmoRjALwS39+C1C2kJkDqCSi5e358ZsD1ZinjhsReeeX+k
	 UYJPcm3D/SmZHK3Jomuhcw6E/Y8RX/c3Hi1r2pWjOMG2/Oke90L56Ta6seZBLL07H2
	 k+VXTxheH9jlg==
Date: Wed, 8 Jul 2026 20:47:25 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Gustavo Luiz Duarte <gustavold@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Breno Leitao <leitao@debian.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: kconfig: merge_config.sh: keep temp file in the
 output dir
Message-ID: <ak6bPbhLtfBV5M0q@levanger>
Mail-Followup-To: Gustavo Luiz Duarte <gustavold@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Breno Leitao <leitao@debian.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260708-merge_config_output-v1-1-e35fa223d6f3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-merge_config_output-v1-1-e35fa223d6f3@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:gustavold@gmail.com,m:nathan@kernel.org,m:leitao@debian.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13955-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,merge_config.sh:url,levanger:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB965729B85

On Wed, Jul 08, 2026 at 04:04:54AM -0700, Gustavo Luiz Duarte wrote:
> merge_config.sh currently creates a temporary file in the current
> directory. Create it under $OUTPUT instead, which allows running the
> script against a read-only source tree.
> 
> The default behavior is unchanged: $OUTPUT is "." so the file stays in
> the cwd.

Out of curiosity: in which situation do you need this fix?

> 
> Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
> ---
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index f08e0863b7128..a63250d4cbf12 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -122,7 +122,7 @@ fi
>  
>  MERGE_LIST=$*
>  
> -TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> +TMP_FILE=$(mktemp "$OUTPUT/.tmp.config.XXXXXXXXXX")

<bike-shedding>
While this does as written in the commit message, I'd rather expected
something like

 mktemp --tmpdir="$OUTPUT" .tmp.config.XXXXXXXXXX

instead.
</bike-shedding>


When I am reading the help text for merge_config.sh's '-O', I think we
should adjust the default output directory as well:

  -O    dir to put generated output files.  Consider setting $KCONFIG_CONFIG instead.

With a read-only source tree in mind, KCONFIG_CONFIG probably has to be
set, otherwise we'd not need to put the temporary file somewhere else.
Might it be more consistent to use $(dirname ${KBUILD_KCONFIG}) as
default for OUTPUT instead of '.'?

So, once again: in which situation do you need the fix?  Is it really
sufficient as it is?


Nevertheless, I think it's a good idea, thanks for the patch.

Kind regards,
Nicolas

