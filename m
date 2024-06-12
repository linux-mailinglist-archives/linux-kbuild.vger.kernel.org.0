Return-Path: <linux-kbuild+bounces-2101-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AF5905BF2
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 21:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D272289D12
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 19:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB8782C8E;
	Wed, 12 Jun 2024 19:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="jYy1ktd0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05461374D3;
	Wed, 12 Jun 2024 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718220537; cv=none; b=GDImIqe+nEh4hGZ3PqIWoEWKdIbsWYFUyHjd31IUEc8DaQWvhZK5WYiCyuPGYrcEY+uymzJJXxeFSqMgXNmqIPFPUYaG4+oNwRzP8J521Yr1bTydVWZIBTyKHQ8HdafyiMZHTyHMQLto2EU/guVSkvW/PiXCouxBby2LBcPRVIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718220537; c=relaxed/simple;
	bh=aisbJ+fDLilxRFYRm766lfzrtLzz/zIUIO1kpGOh1Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/Gis85zVocI9FLkFcQQbTJGdGw8HAC3pMwPAEnMYXudFY2lRoIMqL1sdnpILoDRaB+Rb73ZkCbYqR4uaqK6yZanDKsVieUXRvZw2RCry+jGB2DJAFIdlB+7wmmZHv+3uAQAN5gO5gD7FKmJcICb5ov5DWrpIaMfFZsi0rZLuww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=jYy1ktd0; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2MMlrIS3G55GLfVDrL+o1lC5+cNychTK4Mj+Z8dTiaM=; b=jYy1ktd0p5FmuqKrwaQnng8OvY
	lGMmjdeLUGjZP28dJMfPGRqNh0Oyv8/z0BHo8Ap+uFbYE4B67FZ1CfgKTdqD+x/Kpy7jQl2xG8WVu
	AFJwnBA/YoJon7oyqo4+htklduONJ48fvLisp6bpTF5BilkM8sujZmrQ88INEjT1S7B7Yx2PRFpBj
	cYCdHRbRBE93eIa5Ux9cXm6ix1mOXORAmMFFRvkRie1zxvXRyffhxgB2Ccr6YNM0VpxL4T9U7tmni
	rUS/sNEUBDiMuUQc8ttwP/6BX377sNbLnskV2vGDqWCMTzGQISCr1eZn1G/zxWDPyZjQan4PW0sm/
	VlopXtfg==;
Received: from [2001:9e8:9cb:9501:3235:adff:fed0:37e6] (port=60650 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sHTeE-005PFv-CJ;
	Wed, 12 Jun 2024 21:28:42 +0200
Date: Wed, 12 Jun 2024 21:28:38 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kconfig: add -e and -u options to *conf-cfg.sh
 scripts
Message-ID: <20240612-fluorescent-magnificent-bettong-83ead6@lindesnes>
References: <20240611160938.3511096-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611160938.3511096-1-masahiroy@kernel.org>

On Wed, Jun 12, 2024 at 01:08:05AM +0900, Masahiro Yamada wrote:
> Set -e to make these scripts fail on the first error.
> 
> Set -u because these scripts are invoked by Makefile, and do not work
> properly without necessary variables defined.
> 
> Both options are described in POSIX. [1]
> 
> [1]: https://pubs.opengroup.org/onlinepubs/009604499/utilities/set.html
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Thanks, I think 'set -eu' is really a good thing.  Would like to see it
in even more scripts below scripts/.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Kind regards,
Nicolas

