Return-Path: <linux-kbuild+bounces-3806-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2CC986DC5
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 09:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 367CD1F224BC
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 07:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3424E158535;
	Thu, 26 Sep 2024 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="oKncEawm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F40118638;
	Thu, 26 Sep 2024 07:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727335879; cv=none; b=j1qnaa3FkgIKnNvSoqVWcsjeCqIaWoPCap2MOEzjy14tMD5SX+uX9P3HsL0fWVPjBntZ4NR9j782+jaNH/xs3stkkAkCbzt5Wv4BYR+Z6+NjIroB8UiaVXwEUho6fPslwQIrRiCl/f5Q4x+3edMU3praEWp0x4mCh+LmoqgWm98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727335879; c=relaxed/simple;
	bh=XpdzfcBtOn5omJ6e1kgJ0chhZgkgH8HanLBuFfMLWGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5IWBVxaE5RrM3spps+apGnBrqM5aeBK+L+b/RjXeT9PYNJ4pZl+1ZayELZnYM4f8wLlMseLppcpQqhRfTUFrtCDddhigDBIPr1rINi9oPahuiGiBJDM645FFR4BjPoJyNyT3XSex3z53aVjVNfjzaCvpq52Ll3VBbY/tKtVdxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=oKncEawm; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VLBUEIw4xCM2TscZwB0GXNiTw1S7gGh1+MNWLvSSRQI=; b=oKncEawmSkWbmJHSunCR5/q5xo
	09RA20lu3I1Bd1uAtNeGPWFVErDwXVUqiqB2WExudEbMxH5RmOnorkgxE+ohTb8T7zX/B6gurY5Qu
	edHBzVyIfiy/b8UsB+JLe0HLNvP25ig1e6dvjRDPbLXrXzm8BfTuxWhowAougR2sNHLWP/V6nemNx
	hSIptuQiGHpaUreKu/01pq5v4OM5M/ZZW5Vs2iGrO5fzaogKiui3NqXhySE6Uw7km/G6f0MmaGwJE
	/a2rVinRkstNrDT0aqQnbA0tYYDMDIWpgVoe/HEZm4GSWS73bdiSvGwyZwpgUUrx/9LHNdgbUnjN7
	k4XcTzoQ==;
Received: from [2001:9e8:9c4:3401:3235:adff:fed0:37e6] (port=34332 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1stixr-008tj2-ER;
	Thu, 26 Sep 2024 09:31:03 +0200
Date: Thu, 26 Sep 2024 09:30:58 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Nicolas Schier <n.schier@avm.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 12/23] scripts/nsdeps: use VPATH as src_prefix
Message-ID: <20240926-stirring-talented-boa-1b311a@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-13-masahiroy@kernel.org>
 <ZvQb0Bsvrm-HLQ6g@l-nschier-nb>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvQb0Bsvrm-HLQ6g@l-nschier-nb>

On Wed, Sep 25, 2024 at 04:18:56PM +0200, Nicolas Schier wrote:
> On Tue, Sep 17, 2024 at 11:16:40PM +0900, Masahiro Yamada wrote:
> > This change allows it to work not only for in-tree modules but also for
> > external modules, even if they are built in a separate build directory.
> > 
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> > 
> >  scripts/nsdeps | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/nsdeps b/scripts/nsdeps
> > index f1718cc0d700..8b4db63838ce 100644
> > --- a/scripts/nsdeps
> > +++ b/scripts/nsdeps
> > @@ -19,10 +19,10 @@ if ! { echo "$SPATCH_REQ_VERSION"; echo "$SPATCH_VERSION"; } | sort -CV ; then
> >  	exit 1
> >  fi
> >  
> > -if [ "$KBUILD_EXTMOD" ]; then
> > +if [ "${VPATH+set}" ]; then
> >  	src_prefix=
> >  else
> > -	src_prefix=$srctree/
> > +	src_prefix=$VPATH/
> 
> In kbuild, we expect VPATH to be empty or hold one single directory,
> while make itself allows VPATH to be a list of directories.  Might it
> make sense to mention this at some place?

I'd like to withdraw that question.  VPATH usage is an implementation
detail and it's probably not helpful to put too much effort into keeping
such things documentated.

