Return-Path: <linux-kbuild+bounces-2763-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2932A94375B
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2024 22:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D446A1F21BBC
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2024 20:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BC84776A;
	Wed, 31 Jul 2024 20:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="jYVbQ0ZO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9665917543;
	Wed, 31 Jul 2024 20:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722458862; cv=none; b=C4WlfmW6IHOu+A1X76d4hoTJ1N0F/4FlbkHDmbRB9R9p04J6BPfhnLhOu2x+JMzS/Q3ANY7FEIhjD39h81DEAjRyw1hysoPsI24x0kmsd/txQzGsmAtIPbVfvBM4TxEZ1vkfPA5kXbEjV1Hdo4rKBwsUr18JqA4ugPHVrA5ZlmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722458862; c=relaxed/simple;
	bh=6GI437kxfcxbyHL2J71e2uhod0ZNk1DRb13coGms1rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyQZXJucQkaH2scYyJtTccuU3BISjqID+xckmy6zsyycZn54+IwMQm6AXMJenKOKRMrwB1CyTmzz89AWdSwfrzg1qatGEfi/t9mct2gLLANg1LSI/rTUoTMqL+majAsP2k8scEweKNcQTg+HyWGyGt0TAA9CrUxm8yyHiox8Vno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=jYVbQ0ZO; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TWh2jtULicJS4e6o3gtav6LoiukZ/VmA2CtVVW5fe0M=; b=jYVbQ0ZOPIz5X41gXzK3q0FueJ
	j2/RVW+2E6olE/wYs175ZIi5OHSwmv28bg5Vdmez1QhiXX+1G8I6hsoQcFcKN/5OWQ/lQUdFpMqUQ
	IujhFPidVVGP5jWImc7jvL9ipArXiD7Hd3sy94M+ULjxn4CNoofMv67YIoaYbldts1/sRTcvHL912
	eST0xHFx4w2fdOslUs/n6YTakbrK6/5Ttu1DdPh1cdoPKc8vniAYMJpVRQrTp8cmYlZN1kmYf0WfO
	RhDlYc5iYqIx1LRW541fH/G6uG0x97KmGNe8n54Tk/JVVrQO8F5GhdiL5tLagrig+w2LVo+YjpKZd
	I5wklzQw==;
Received: from [2001:9e8:9fa:4501:3235:adff:fed0:37e6] (port=53628 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sZGEK-009EnU-Lx;
	Wed, 31 Jul 2024 22:47:28 +0200
Date: Wed, 31 Jul 2024 22:47:25 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 2/4] modpost: detect endianness on run-time
Message-ID: <20240731-sassy-hysterical-petrel-fa7fcd@lindesnes>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727074526.1771247-3-masahiroy@kernel.org>

On Sat, Jul 27, 2024 at 04:42:02PM +0900, Masahiro Yamada wrote:
> Endianness is currently detected on compile-time, but we can defer this
> until run-time. This change avoids re-executing scripts/mod/mk_elfconfig
> even if modpost in the linux-headers package needs to be rebuilt for a
> foreign architecture.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

