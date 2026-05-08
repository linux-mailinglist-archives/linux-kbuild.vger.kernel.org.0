Return-Path: <linux-kbuild+bounces-13084-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG3WCwvW/Wl2jgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13084-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 08 May 2026 14:24:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4712D4F6590
	for <lists+linux-kbuild@lfdr.de>; Fri, 08 May 2026 14:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8A6E300FCD0
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 May 2026 12:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CB43DCDB6;
	Fri,  8 May 2026 12:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHV8h/Y+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DBF3DCD98;
	Fri,  8 May 2026 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778242998; cv=none; b=P/pCb5UfI0bNkW2KJG7JS4Dhz2pQ6e30I0V5hk3CGFyBy8ryOtJKB3a48GnMzYg+83CLzoX/5FOndeCu6xRC1bTxPnG3UOOpj5P9dd9TT8PPnl92279XxZuyWtYxhdR0KH8+cFBpWyZwztavNzejfNEnrC8f8n8ZSADDcpxwksQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778242998; c=relaxed/simple;
	bh=n1EoZXYaGhjao37jkHJyX8h7nF3Gjw3TV/O0yZ8tQUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WP8+k5j7Fx//b0q9D5fN42rGnk18dAbO3MSPxJ4uwnlzpXJd5q8JCWYQrKl4XmYJuG7MRtaTIeKYcmDyQtolSB3W+33YeJjiAbl1EcaPippFK9KqSvwIqJinGg3d81WpcPRiiOkukd+jl/AiCypQDymrXBwhaXPW9K220CgEf+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHV8h/Y+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D960C2BCB8;
	Fri,  8 May 2026 12:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778242997;
	bh=n1EoZXYaGhjao37jkHJyX8h7nF3Gjw3TV/O0yZ8tQUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHV8h/Y+lxgiEXJjOcHZ++8rOwA/3fkFeel9/LUMsXdJ41SxGPk2X3zX2FO9xISQM
	 nzIYUmr8Xa4WEiIAXHFqNNBdKiXibmd6WsKO/Tkmiei0ycB+ND3pqb4Kf+qrMXqZK9
	 cNGt6Sr1HhpW34U1cWj/FBgLkN51neFOHe7kGVk/TP3fdgPAWBkQduuymCH8XAzsZ3
	 suEfqMQRFxIPkR7PkcWb2zUgIzXO+yn7Bc6A04V8XfgPwV/6+0bgnaFxOTbH/Y7Ifo
	 BF1bwjAASIDJQBLiaHWHUKsR+FFc4pPKjfxnuIt4aFZ2ajPLIjQh5Im5KqYZuQY2zD
	 CsOFZOx2LnE9Q==
Date: Fri, 8 May 2026 20:23:11 +0800
From: Nathan Chancellor <nathan@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Test User <test@example.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: wire style checker into
 dt_binding_check
Message-ID: <20260508122311.GC208829@ax162>
References: <cover.1777471439.git.daniel@makrotopia.org>
 <ed254ed45f19f37a7e7933a33f2f00195d8e5f20.1777471439.git.daniel@makrotopia.org>
 <20260506184447.GA2816439-robh@kernel.org>
 <20260507092641.GA1785345@ax162>
 <20260507170021.GA2060923-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507170021.GA2060923-robh@kernel.org>
X-Rspamd-Queue-Id: 4712D4F6590
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13084-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[makrotopia.org,kernel.org,weissschuh.net,goodmis.org,roeck-us.net,wp.pl,example.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 12:00:21PM -0500, Rob Herring wrote:
> On Thu, May 07, 2026 at 05:26:41PM +0800, Nathan Chancellor wrote:
> > In general, scripts should be called with an explicit interpreter to
> > 
> > 1. not rely on the file being executable (I think quilt has issues with
> > this at times?)
> 
> Does that apply to external scripts? Not the case here, but for the rest 
> of this file that is the case.

I guess it depends on if anyone notices? :) but realistically, if it is
coming from somewhere where it is guaranteed to be executable, then I
assume it does not matter.

-- 
Cheers,
Nathan

