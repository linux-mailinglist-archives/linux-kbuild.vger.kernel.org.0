Return-Path: <linux-kbuild+bounces-12344-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BSrM5wNymmL4gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12344-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 07:43:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F39D355AB1
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 07:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D25363003992
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 05:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63591FBC8C;
	Mon, 30 Mar 2026 05:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeUf1Dlg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B9E40DFB4;
	Mon, 30 Mar 2026 05:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774849434; cv=none; b=d+4ElV2b61Or6BCsPNyGg0vyCq47RJKW/Ph6eESYGvhz92aZXWXlw4Z2x2Uma3OpfaXAqHHUDU+3AriD+3pdLuWI99oJEdcQF4wrj9XAOUmhS/pykCW2DBBAt4dq9OkPr1GcsST4D5V3zvz10H2cUA98PMph1V9SOWzd2sC/4jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774849434; c=relaxed/simple;
	bh=1vNL8mmkz8bfmXdvWHeVvvTbsDkR6b12re0ipXjUYKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJJOtKftG4gvJZ27m3ao5CHx22D3O4A91MrfY/8BfE4QpUEyY5k0r7zSJ2zOk5MdlJwJkkjKeojNJqt/F/AkY10txclynKBXFkmNbwyerj+HlQGzKQC1soCLQ6m5VWV6/B5omwINzH2GOBRfgYRJTngmnDfZXsy3jtyfe9JIxCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeUf1Dlg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3A6C4CEF7;
	Mon, 30 Mar 2026 05:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774849434;
	bh=1vNL8mmkz8bfmXdvWHeVvvTbsDkR6b12re0ipXjUYKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AeUf1DlgZ3LE5rcKPi7DKrqqAHEf6CaR+TTjbw7RYObnLrRtjTRGsHO1/cVtxzTDo
	 Oc2VSEetSJ/PsSCAKCVykUwFTu2xg4Hl5tRDj2Ln6+w7F4YE4ND1nl3cWb7cm7AmuG
	 7XOs02/nkVeXTmEeFKXLlvEbH7oBlp30OhabMe4cO0mqVcGwtef8Tf1OVzv9bfTQoT
	 xKIbU25YARBBuUqBLUzdpTXKq9umarPhXAEdQT5ULZEeXcBdYNGIHh3rLGl2FLrkUp
	 gjOgLhdURnsye4RZ4KyfnPERPcOnqXupwpxo1zz1vcua20nJDcvjf9JruuLIMQbbSq
	 PZTjvjBKBhPHg==
Date: Mon, 30 Mar 2026 07:43:50 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Samuel Rowberry <sprowdev@gmail.com>, masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: add GCC stability warning
Message-ID: <20260330054350.GC879042@ax162>
References: <20260329192139.475926-1-sprowdev@gmail.com>
 <acmBHIotA4p50qJQ@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acmBHIotA4p50qJQ@levanger>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12344-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 6F39D355AB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 09:44:28PM +0200, Nicolas Schier wrote:
> Hi Samuel,
> 
> On Sun, Mar 29, 2026 at 01:21:39PM -0600, Samuel Rowberry wrote:
> > Newer GCC versions are not fully compatible with the code.
> > Adding a warning lets users know without getting in the way
> > of setups where it is okay to use GCC 15 (or is needed.)
> 
> can you please elaborate, _why_ you state that gcc 15 is incompatible in
> some ways?

Yeah, I don't think we should have something like this. GCC 15 works
perfectly fine for me and many others, so this warning will just be
noise for no purpose. If there is a problem you are seeing with GCC 15,
we should address it, not just say amorphously that there may be
incompatibilities. Same goes for any GCC version really.

Cheers,
Nathan

