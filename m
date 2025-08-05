Return-Path: <linux-kbuild+bounces-8298-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4862B1BBDB
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 23:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EE34622774
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 21:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A544323BCFF;
	Tue,  5 Aug 2025 21:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqSTVwqD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729831FDD;
	Tue,  5 Aug 2025 21:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754430509; cv=none; b=B+eeZaHaVuukN4HAjtROXjS+4BjizgSRVyGzivX9uHWHRDIUnvVInAf1T6/AJMEW3RyD2xaQSSNHvejDKOBOLd0wnohiOXzeS3h6BTI1OiY3QsrRtDJrqMQP267llciD+HAHh5a51N5PxB9AwM/l07D9MiE+MLRega0Fg4vyGGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754430509; c=relaxed/simple;
	bh=r0+4GeV4tZNDliUsJBvzpYIDNR8eo3viWiJWjIHPbus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Znculr6kfnkL0Rh6wak6U/+9TaQK3ZXRIhOvuvonNm0jk6k5WoKdUeJ0aPoWkYpj1EsAeGsKKdV9bnuv16ZCVhaEcLDrJU8nPOcyKbn4BcrfzRX7SYyx4fCjFn9IdOcs64M+7f8D/Mp7RjZ7WqPo9nLwW5FOKMoX9N/ad4FCgUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqSTVwqD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC17C4CEF0;
	Tue,  5 Aug 2025 21:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754430508;
	bh=r0+4GeV4tZNDliUsJBvzpYIDNR8eo3viWiJWjIHPbus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqSTVwqD7yOuPpApeNE4VLtVGaARP9F3w0YbozmADV7KCh0CDsyOPMlRs0tDMv6HT
	 6FfB24HmRExiKu5ay/pYduFO/Q510J09T6y8grRuC6HOfnJFj/9IY5+gOJHwgMPcfr
	 5u4y6/AYgAmlaXuTvc+GZqhbxxrW964oYa6YzzfayXcfxvaIHpAxOerulyhFFfiprr
	 R9GduqfdeqnbzWZ3JWTR2Wy9+nASp2IaspVL3VZjrc0Gg6bLv/D3fY+WyoRtHUn4Ky
	 5zYKjIIGDJmZ5/8Nd+UfdMSlRkDb35a3H8ob1AaIvNwNLeN8/pFNacwN8KbZIaj3iO
	 P0sLzkJWm7v3w==
Date: Tue, 5 Aug 2025 14:48:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Re-enable -Wunterminated-string-initialization
Message-ID: <20250805214823.GB200407@ax162>
References: <20250802184328.it.438-kees@kernel.org>
 <20250803173235.GA716998@ax162>
 <e4d801e3-3004-484b-897d-ed43c25e1576@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4d801e3-3004-484b-897d-ed43c25e1576@intel.com>

On Tue, Aug 05, 2025 at 04:50:28PM +0200, Alexander Lobakin wrote:
> From: Nathan Chancellor <nathan@kernel.org>
> Date: Sun, 3 Aug 2025 10:32:35 -0700
> 
> > On Sat, Aug 02, 2025 at 11:43:32AM -0700, Kees Cook wrote:
> >> With the few remaining fixes now landed, we can re-enable the option
> >> -Wunterminated-string-initialization (via -Wextra). Both GCC and Clang
> >> have the required multi-dimensional nonstring attribute support.
> 
> [...]
> 
> > diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
> > index 55a1a96cd834..05d4323c6a13 100644
> > --- a/drivers/net/ethernet/ti/netcp_ethss.c
> > +++ b/drivers/net/ethernet/ti/netcp_ethss.c
> > @@ -771,7 +771,7 @@ static struct netcp_module xgbe_module;
> >  
> >  /* Statistic management */
> >  struct netcp_ethtool_stat {
> > -	char desc[ETH_GSTRING_LEN];
> > +	char desc[ETH_GSTRING_LEN] __nonstring;
> 
> 
> Hmmm, ETH_GSTRING_LEN is the maximum length of the driver's statistics
> name to be reported to Ethtool and this *includes* \0 at the end.
> If this compilation flag triggers a warning here, the driver devs need
> to fix their code. There should always be \0 at the end, `desc` is a
> "proper" C 0-terminated string.

Ack, I had misunderstood a previous fix that Kees did for a similar but
different instance of the warning in another Ethernet driver and I
did not look much further than the driver copying these values around
with memcpy(). This does trigger a warning, from the original message:

  drivers/net/ethernet/ti/netcp_ethss.c:1049:2: error: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Werror,-Wunterminated-string-initialization]
   1049 |         GBENU_STATS_HOST(ale_unknown_ucast_bytes),
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/net/ethernet/ti/netcp_ethss.c:956:2: note: expanded from macro 'GBENU_STATS_HOST'
    956 |         "GBE_HOST:"#field, GBENU_STATS0_MODULE,                 \
        |         ^~~~~~~~~~~~~~~~~
  drivers/net/ethernet/ti/netcp_ethss.c:1051:2: error: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Werror,-Wunterminated-string-initialization]
   1051 |         GBENU_STATS_HOST(ale_unknown_mcast_bytes),
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/net/ethernet/ti/netcp_ethss.c:956:2: note: expanded from macro 'GBENU_STATS_HOST'
    956 |         "GBE_HOST:"#field, GBENU_STATS0_MODULE,                 \
        |         ^~~~~~~~~~~~~~~~~
  drivers/net/ethernet/ti/netcp_ethss.c:1053:2: error: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Werror,-Wunterminated-string-initialization]
   1053 |         GBENU_STATS_HOST(ale_unknown_bcast_bytes),
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/net/ethernet/ti/netcp_ethss.c:956:2: note: expanded from macro 'GBENU_STATS_HOST'
    956 |         "GBE_HOST:"#field, GBENU_STATS0_MODULE,                 \
        |         ^~~~~~~~~~~~~~~~~

So it seems to me like this is a legitimate problem? Are these
descriptions expected to be stable once they are released or are we able
to adjust them? We could maybe shave an 'o' from 'unknown' to easily
resolve this without losing much in the way of quick visual processing.

Cheers,
Nathan

diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
index 55a1a96cd834..70590a04b6fd 100644
--- a/drivers/net/ethernet/ti/netcp_ethss.c
+++ b/drivers/net/ethernet/ti/netcp_ethss.c
@@ -493,12 +493,12 @@ struct gbenu_hw_stats {
 	u32	ale_vid_ingress_drop;
 	u32	ale_da_eq_sa_drop;
 	u32	__rsvd_0[3];
-	u32	ale_unknown_ucast;
-	u32	ale_unknown_ucast_bytes;
-	u32	ale_unknown_mcast;
-	u32	ale_unknown_mcast_bytes;
-	u32	ale_unknown_bcast;
-	u32	ale_unknown_bcast_bytes;
+	u32	ale_unknwn_ucast;
+	u32	ale_unknwn_ucast_bytes;
+	u32	ale_unknwn_mcast;
+	u32	ale_unknwn_mcast_bytes;
+	u32	ale_unknwn_bcast;
+	u32	ale_unknwn_bcast_bytes;
 	u32	ale_pol_match;
 	u32	ale_pol_match_red;		/* NU */
 	u32	ale_pol_match_yellow;		/* NU */
@@ -953,7 +953,7 @@ static const struct netcp_ethtool_stat gbe13_et_stats[] = {
 
 #define GBENU_STATS_HOST(field)					\
 {								\
-	"GBE_HOST:"#field, GBENU_STATS0_MODULE,			\
+	"GBE_HST:"#field, GBENU_STATS0_MODULE,			\
 	sizeof_field(struct gbenu_hw_stats, field),		\
 	offsetof(struct gbenu_hw_stats, field)			\
 }
@@ -1045,12 +1045,12 @@ static const struct netcp_ethtool_stat gbenu_et_stats[] = {
 	GBENU_STATS_HOST(ale_rate_limit_drop),
 	GBENU_STATS_HOST(ale_vid_ingress_drop),
 	GBENU_STATS_HOST(ale_da_eq_sa_drop),
-	GBENU_STATS_HOST(ale_unknown_ucast),
-	GBENU_STATS_HOST(ale_unknown_ucast_bytes),
-	GBENU_STATS_HOST(ale_unknown_mcast),
-	GBENU_STATS_HOST(ale_unknown_mcast_bytes),
-	GBENU_STATS_HOST(ale_unknown_bcast),
-	GBENU_STATS_HOST(ale_unknown_bcast_bytes),
+	GBENU_STATS_HOST(ale_unknwn_ucast),
+	GBENU_STATS_HOST(ale_unknwn_ucast_bytes),
+	GBENU_STATS_HOST(ale_unknwn_mcast),
+	GBENU_STATS_HOST(ale_unknwn_mcast_bytes),
+	GBENU_STATS_HOST(ale_unknwn_bcast),
+	GBENU_STATS_HOST(ale_unknwn_bcast_bytes),
 	GBENU_STATS_HOST(ale_pol_match),
 	GBENU_STATS_HOST(ale_pol_match_red),
 	GBENU_STATS_HOST(ale_pol_match_yellow),
@@ -1111,12 +1111,12 @@ static const struct netcp_ethtool_stat gbenu_et_stats[] = {
 	GBENU_STATS_P1(ale_rate_limit_drop),
 	GBENU_STATS_P1(ale_vid_ingress_drop),
 	GBENU_STATS_P1(ale_da_eq_sa_drop),
-	GBENU_STATS_P1(ale_unknown_ucast),
-	GBENU_STATS_P1(ale_unknown_ucast_bytes),
-	GBENU_STATS_P1(ale_unknown_mcast),
-	GBENU_STATS_P1(ale_unknown_mcast_bytes),
-	GBENU_STATS_P1(ale_unknown_bcast),
-	GBENU_STATS_P1(ale_unknown_bcast_bytes),
+	GBENU_STATS_P1(ale_unknwn_ucast),
+	GBENU_STATS_P1(ale_unknwn_ucast_bytes),
+	GBENU_STATS_P1(ale_unknwn_mcast),
+	GBENU_STATS_P1(ale_unknwn_mcast_bytes),
+	GBENU_STATS_P1(ale_unknwn_bcast),
+	GBENU_STATS_P1(ale_unknwn_bcast_bytes),
 	GBENU_STATS_P1(ale_pol_match),
 	GBENU_STATS_P1(ale_pol_match_red),
 	GBENU_STATS_P1(ale_pol_match_yellow),
@@ -1177,12 +1177,12 @@ static const struct netcp_ethtool_stat gbenu_et_stats[] = {
 	GBENU_STATS_P2(ale_rate_limit_drop),
 	GBENU_STATS_P2(ale_vid_ingress_drop),
 	GBENU_STATS_P2(ale_da_eq_sa_drop),
-	GBENU_STATS_P2(ale_unknown_ucast),
-	GBENU_STATS_P2(ale_unknown_ucast_bytes),
-	GBENU_STATS_P2(ale_unknown_mcast),
-	GBENU_STATS_P2(ale_unknown_mcast_bytes),
-	GBENU_STATS_P2(ale_unknown_bcast),
-	GBENU_STATS_P2(ale_unknown_bcast_bytes),
+	GBENU_STATS_P2(ale_unknwn_ucast),
+	GBENU_STATS_P2(ale_unknwn_ucast_bytes),
+	GBENU_STATS_P2(ale_unknwn_mcast),
+	GBENU_STATS_P2(ale_unknwn_mcast_bytes),
+	GBENU_STATS_P2(ale_unknwn_bcast),
+	GBENU_STATS_P2(ale_unknwn_bcast_bytes),
 	GBENU_STATS_P2(ale_pol_match),
 	GBENU_STATS_P2(ale_pol_match_red),
 	GBENU_STATS_P2(ale_pol_match_yellow),
@@ -1243,12 +1243,12 @@ static const struct netcp_ethtool_stat gbenu_et_stats[] = {
 	GBENU_STATS_P3(ale_rate_limit_drop),
 	GBENU_STATS_P3(ale_vid_ingress_drop),
 	GBENU_STATS_P3(ale_da_eq_sa_drop),
-	GBENU_STATS_P3(ale_unknown_ucast),
-	GBENU_STATS_P3(ale_unknown_ucast_bytes),
-	GBENU_STATS_P3(ale_unknown_mcast),
-	GBENU_STATS_P3(ale_unknown_mcast_bytes),
-	GBENU_STATS_P3(ale_unknown_bcast),
-	GBENU_STATS_P3(ale_unknown_bcast_bytes),
+	GBENU_STATS_P3(ale_unknwn_ucast),
+	GBENU_STATS_P3(ale_unknwn_ucast_bytes),
+	GBENU_STATS_P3(ale_unknwn_mcast),
+	GBENU_STATS_P3(ale_unknwn_mcast_bytes),
+	GBENU_STATS_P3(ale_unknwn_bcast),
+	GBENU_STATS_P3(ale_unknwn_bcast_bytes),
 	GBENU_STATS_P3(ale_pol_match),
 	GBENU_STATS_P3(ale_pol_match_red),
 	GBENU_STATS_P3(ale_pol_match_yellow),
@@ -1309,12 +1309,12 @@ static const struct netcp_ethtool_stat gbenu_et_stats[] = {
 	GBENU_STATS_P4(ale_rate_limit_drop),
 	GBENU_STATS_P4(ale_vid_ingress_drop),
 	GBENU_STATS_P4(ale_da_eq_sa_drop),
-	GBENU_STATS_P4(ale_unknown_ucast),
-	GBENU_STATS_P4(ale_unknown_ucast_bytes),
-	GBENU_STATS_P4(ale_unknown_mcast),
-	GBENU_STATS_P4(ale_unknown_mcast_bytes),
-	GBENU_STATS_P4(ale_unknown_bcast),
-	GBENU_STATS_P4(ale_unknown_bcast_bytes),
+	GBENU_STATS_P4(ale_unknwn_ucast),
+	GBENU_STATS_P4(ale_unknwn_ucast_bytes),
+	GBENU_STATS_P4(ale_unknwn_mcast),
+	GBENU_STATS_P4(ale_unknwn_mcast_bytes),
+	GBENU_STATS_P4(ale_unknwn_bcast),
+	GBENU_STATS_P4(ale_unknwn_bcast_bytes),
 	GBENU_STATS_P4(ale_pol_match),
 	GBENU_STATS_P4(ale_pol_match_red),
 	GBENU_STATS_P4(ale_pol_match_yellow),
@@ -1375,12 +1375,12 @@ static const struct netcp_ethtool_stat gbenu_et_stats[] = {
 	GBENU_STATS_P5(ale_rate_limit_drop),
 	GBENU_STATS_P5(ale_vid_ingress_drop),
 	GBENU_STATS_P5(ale_da_eq_sa_drop),
-	GBENU_STATS_P5(ale_unknown_ucast),
-	GBENU_STATS_P5(ale_unknown_ucast_bytes),
-	GBENU_STATS_P5(ale_unknown_mcast),
-	GBENU_STATS_P5(ale_unknown_mcast_bytes),
-	GBENU_STATS_P5(ale_unknown_bcast),
-	GBENU_STATS_P5(ale_unknown_bcast_bytes),
+	GBENU_STATS_P5(ale_unknwn_ucast),
+	GBENU_STATS_P5(ale_unknwn_ucast_bytes),
+	GBENU_STATS_P5(ale_unknwn_mcast),
+	GBENU_STATS_P5(ale_unknwn_mcast_bytes),
+	GBENU_STATS_P5(ale_unknwn_bcast),
+	GBENU_STATS_P5(ale_unknwn_bcast_bytes),
 	GBENU_STATS_P5(ale_pol_match),
 	GBENU_STATS_P5(ale_pol_match_red),
 	GBENU_STATS_P5(ale_pol_match_yellow),
@@ -1441,12 +1441,12 @@ static const struct netcp_ethtool_stat gbenu_et_stats[] = {
 	GBENU_STATS_P6(ale_rate_limit_drop),
 	GBENU_STATS_P6(ale_vid_ingress_drop),
 	GBENU_STATS_P6(ale_da_eq_sa_drop),
-	GBENU_STATS_P6(ale_unknown_ucast),
-	GBENU_STATS_P6(ale_unknown_ucast_bytes),
-	GBENU_STATS_P6(ale_unknown_mcast),
-	GBENU_STATS_P6(ale_unknown_mcast_bytes),
-	GBENU_STATS_P6(ale_unknown_bcast),
-	GBENU_STATS_P6(ale_unknown_bcast_bytes),
+	GBENU_STATS_P6(ale_unknwn_ucast),
+	GBENU_STATS_P6(ale_unknwn_ucast_bytes),
+	GBENU_STATS_P6(ale_unknwn_mcast),
+	GBENU_STATS_P6(ale_unknwn_mcast_bytes),
+	GBENU_STATS_P6(ale_unknwn_bcast),
+	GBENU_STATS_P6(ale_unknwn_bcast_bytes),
 	GBENU_STATS_P6(ale_pol_match),
 	GBENU_STATS_P6(ale_pol_match_red),
 	GBENU_STATS_P6(ale_pol_match_yellow),
@@ -1507,12 +1507,12 @@ static const struct netcp_ethtool_stat gbenu_et_stats[] = {
 	GBENU_STATS_P7(ale_rate_limit_drop),
 	GBENU_STATS_P7(ale_vid_ingress_drop),
 	GBENU_STATS_P7(ale_da_eq_sa_drop),
-	GBENU_STATS_P7(ale_unknown_ucast),
-	GBENU_STATS_P7(ale_unknown_ucast_bytes),
-	GBENU_STATS_P7(ale_unknown_mcast),
-	GBENU_STATS_P7(ale_unknown_mcast_bytes),
-	GBENU_STATS_P7(ale_unknown_bcast),
-	GBENU_STATS_P7(ale_unknown_bcast_bytes),
+	GBENU_STATS_P7(ale_unknwn_ucast),
+	GBENU_STATS_P7(ale_unknwn_ucast_bytes),
+	GBENU_STATS_P7(ale_unknwn_mcast),
+	GBENU_STATS_P7(ale_unknwn_mcast_bytes),
+	GBENU_STATS_P7(ale_unknwn_bcast),
+	GBENU_STATS_P7(ale_unknwn_bcast_bytes),
 	GBENU_STATS_P7(ale_pol_match),
 	GBENU_STATS_P7(ale_pol_match_red),
 	GBENU_STATS_P7(ale_pol_match_yellow),
@@ -1573,12 +1573,12 @@ static const struct netcp_ethtool_stat gbenu_et_stats[] = {
 	GBENU_STATS_P8(ale_rate_limit_drop),
 	GBENU_STATS_P8(ale_vid_ingress_drop),
 	GBENU_STATS_P8(ale_da_eq_sa_drop),
-	GBENU_STATS_P8(ale_unknown_ucast),
-	GBENU_STATS_P8(ale_unknown_ucast_bytes),
-	GBENU_STATS_P8(ale_unknown_mcast),
-	GBENU_STATS_P8(ale_unknown_mcast_bytes),
-	GBENU_STATS_P8(ale_unknown_bcast),
-	GBENU_STATS_P8(ale_unknown_bcast_bytes),
+	GBENU_STATS_P8(ale_unknwn_ucast),
+	GBENU_STATS_P8(ale_unknwn_ucast_bytes),
+	GBENU_STATS_P8(ale_unknwn_mcast),
+	GBENU_STATS_P8(ale_unknwn_mcast_bytes),
+	GBENU_STATS_P8(ale_unknwn_bcast),
+	GBENU_STATS_P8(ale_unknwn_bcast_bytes),
 	GBENU_STATS_P8(ale_pol_match),
 	GBENU_STATS_P8(ale_pol_match_red),
 	GBENU_STATS_P8(ale_pol_match_yellow),

