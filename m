Return-Path: <linux-kbuild+bounces-13057-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGwSNtJb/GndOQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13057-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 11:30:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868C4E5ED8
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 11:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 065E6306C100
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2026 09:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31213C2795;
	Thu,  7 May 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1IOlUIw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1823C0626;
	Thu,  7 May 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146007; cv=none; b=kWHLvC6jWCXThm/ulQg9Fk2R6J1qTan7UEJvUjJUeR1hBoXhvM18Wir5UiwA8gfR/I9BHwjz1l0P9Gx0h7Xj+udO6q52ipasTvD+zAhrR9EkpoYwGvitrgqcLTkr/EYUJGPN8Ti7e3DHOnhsESwWnjxOYDAvmzC8GkWde5j7LKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146007; c=relaxed/simple;
	bh=n2k9d6Qmr2Qrr9CybM4JgqIb4aCIGw14I7nV7zxpHvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwtDgpgvLZ6RwYDDLdP9nTr2dgyldiDNpZLjeLGt2VYDP4Y8GBRABoV7NzWTHOkX2YxUnW6WYtIpMmdLWO5dLb8oJRjSs+tp8Igjk9LEVUHLFGNcrkRcgTZAndefj7AbmzkcjF9XyN8zPLUJJ6ypDDLr1CxTPv0jauKyRvg7N0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1IOlUIw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDAEC2BCB8;
	Thu,  7 May 2026 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778146007;
	bh=n2k9d6Qmr2Qrr9CybM4JgqIb4aCIGw14I7nV7zxpHvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1IOlUIwK1CmoO17EvYml7T1LaDq46EFi5OMVpJf4C/bc53XtrzOOcHRD+NQTWbo+
	 RfjTNfhJjZNtzM0N4QKlvJLKG82anBx/BMCpqkCAvrTwuhb+ALT/sQsGZBWPJLqraT
	 eMX/xyo7Jg35qFwl4ywPgR10OMxObdf+uE1n+8I9PHc2WHKNO4F9ksahYDN5PzBSLs
	 HMZMxtkcxQJGaPJwBvd6KvWF8vZ+GPyEyOOqc4uIxArAezJt29xPGDcMsOOWa/LXHd
	 JNRiQnsIoPaLVAkagpELHwsch3vjIlSnnlzYs2wLbff8RV6s3Q2zaPsk+1M2LLKd1v
	 NyCwTwJh/qpgw==
Date: Thu, 7 May 2026 17:26:41 +0800
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
Message-ID: <20260507092641.GA1785345@ax162>
References: <cover.1777471439.git.daniel@makrotopia.org>
 <ed254ed45f19f37a7e7933a33f2f00195d8e5f20.1777471439.git.daniel@makrotopia.org>
 <20260506184447.GA2816439-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506184447.GA2816439-robh@kernel.org>
X-Rspamd-Queue-Id: 5868C4E5ED8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13057-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 01:44:47PM -0500, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 03:21:33PM +0100, Daniel Golle wrote:
> > diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> > index 7b668f7fd400..35ddd0b7a349 100644
> > --- a/Documentation/devicetree/bindings/Makefile
> > +++ b/Documentation/devicetree/bindings/Makefile
> > @@ -46,6 +46,19 @@ quiet_cmd_chk_bindings = CHKDT   $(src)
> >  			  xargs -n200 -P$$(nproc) $(DT_DOC_CHECKER) -u $(src)) \
> >  			  && touch $@ || true
> >  
> > +DT_CHK_STYLE = $(srctree)/scripts/dtc/dt-check-style
> > +
> > +# Feed the file list to the checker via @argfile in a single Python
> > +# process so the ruamel.yaml import is paid once. scripts/jobserver-exec
> > +# claims slots from the GNU make jobserver and exposes the count via
> > +# $PARALLELISM, which dt-check-style picks up to size its worker pool.
> > +quiet_cmd_chk_style = STYLE   $(src)
> > +      cmd_chk_style = f=$$(mktemp) && $(find_cmd) > $$f && \
> > +		      $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> > +		      $(PYTHON3) $(DT_CHK_STYLE) @$$f; \
> 
> What's the reason to run via PYTHON3 vs. running dt-check-style 
> directly? It's just different from the rest of this makefile.

In general, scripts should be called with an explicit interpreter to

1. not rely on the file being executable (I think quilt has issues with
this at times?)

2. respect the user's choice of interpreter (if they have specified one)

See "Script invocation" in Documentation/kbuild/makefiles.rst.

-- 
Cheers,
Nathan

