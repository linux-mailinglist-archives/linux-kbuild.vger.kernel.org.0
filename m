Return-Path: <linux-kbuild+bounces-13063-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI0CLUrF/Gk8TgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13063-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 19:00:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 478F24EC98C
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 19:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 089F5301A903
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2026 17:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5049738AC97;
	Thu,  7 May 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJzkQx2C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D46632470E;
	Thu,  7 May 2026 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173224; cv=none; b=tz746F3CnF/UuwXZZPC+YDJFepkmHlFzQ2LZo8/fKMzJ8aRBwTysaNHEo47YHMIuaJg6/qU3EEfDZc/AgP+EwbP9TI4Tp6l9NtXmRJYuEDv2vOZOrU7+sw0XjR54LvSTFadM+M8S/raEOOUmER8hB7VbzUFhd3JCDfPXmkM81rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173224; c=relaxed/simple;
	bh=gSf1g6mjHNSh9sWKL1hVn4bJCnC30BK4It8R4QpVSX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzJIOfB/OfHgDaehWRpGP90XNcKF9KkqtRxHIML3r5tUt1hhlBOm9OuofqSIcJbMXp1zIo7ocrB2kNYg/q19n85Ee09ZcZ3DbfFvKS8My/S8VSIO8eWQujKSAcisO061IWlnudq6lnIowFhK2zUzpE8Wp+ay3Qg2QMXHeJSCzro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJzkQx2C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A3BC2BCB2;
	Thu,  7 May 2026 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778173223;
	bh=gSf1g6mjHNSh9sWKL1hVn4bJCnC30BK4It8R4QpVSX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJzkQx2C1wA/qri+i1U4ARe21ev7UWwgzQgjpBND6EDMztKLpkw8G0H63f0s8qoA1
	 18xb/34umUUf6YIR83oNk6CHr/CYyTHR4xgLiyGij3DD2j83jpRy4w+M8rRguLiM/C
	 YUvOBl3ghVjaB+KjAoWxFWPvqEk3VO3UX+Azm4L3e2GHjeZGDMCXNDeOyywocxGSIM
	 Vy2WMjdcscyGTt2NAAkKYZit4xmtuB3I3iSskz8KwGQQ2Z2GIxYjUuxp0/TqtWSdTU
	 veBxaDki3deVJOU2CO1GCC8xfj7amK1TAuAu/h2tkB6c1NnErKLvH/GRK1NTpT93Yc
	 G7442g+S4DWYw==
Date: Thu, 7 May 2026 12:00:21 -0500
From: Rob Herring <robh@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
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
Message-ID: <20260507170021.GA2060923-robh@kernel.org>
References: <cover.1777471439.git.daniel@makrotopia.org>
 <ed254ed45f19f37a7e7933a33f2f00195d8e5f20.1777471439.git.daniel@makrotopia.org>
 <20260506184447.GA2816439-robh@kernel.org>
 <20260507092641.GA1785345@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507092641.GA1785345@ax162>
X-Rspamd-Queue-Id: 478F24EC98C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[makrotopia.org,kernel.org,weissschuh.net,goodmis.org,roeck-us.net,wp.pl,example.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13063-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 05:26:41PM +0800, Nathan Chancellor wrote:
> On Wed, May 06, 2026 at 01:44:47PM -0500, Rob Herring wrote:
> > On Wed, Apr 29, 2026 at 03:21:33PM +0100, Daniel Golle wrote:
> > > diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> > > index 7b668f7fd400..35ddd0b7a349 100644
> > > --- a/Documentation/devicetree/bindings/Makefile
> > > +++ b/Documentation/devicetree/bindings/Makefile
> > > @@ -46,6 +46,19 @@ quiet_cmd_chk_bindings = CHKDT   $(src)
> > >  			  xargs -n200 -P$$(nproc) $(DT_DOC_CHECKER) -u $(src)) \
> > >  			  && touch $@ || true
> > >  
> > > +DT_CHK_STYLE = $(srctree)/scripts/dtc/dt-check-style
> > > +
> > > +# Feed the file list to the checker via @argfile in a single Python
> > > +# process so the ruamel.yaml import is paid once. scripts/jobserver-exec
> > > +# claims slots from the GNU make jobserver and exposes the count via
> > > +# $PARALLELISM, which dt-check-style picks up to size its worker pool.
> > > +quiet_cmd_chk_style = STYLE   $(src)
> > > +      cmd_chk_style = f=$$(mktemp) && $(find_cmd) > $$f && \
> > > +		      $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> > > +		      $(PYTHON3) $(DT_CHK_STYLE) @$$f; \
> > 
> > What's the reason to run via PYTHON3 vs. running dt-check-style 
> > directly? It's just different from the rest of this makefile.
> 
> In general, scripts should be called with an explicit interpreter to
> 
> 1. not rely on the file being executable (I think quilt has issues with
> this at times?)

Does that apply to external scripts? Not the case here, but for the rest 
of this file that is the case.

Rob

