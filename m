Return-Path: <linux-kbuild+bounces-8152-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5394B1157A
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 02:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE97AE1971
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 00:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF27815B135;
	Fri, 25 Jul 2025 00:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ddYXnLK4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064BC1428E7
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 00:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753405181; cv=none; b=MRjAIpO/3xOqaBZvEbDdap2TuXox5TDDrNi3D3rat2Rj0n35wXdl6cL1Z6vUpXC2W4wp70H2cUBqI4IaOcY+/88/6Pf9O21MzVD93PdUyxkVLBDwB+7bYJo0PiJ539rDeJH8BUBo5nzPJr91kNb87coLxCNOIyGRWBYg+/9EuwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753405181; c=relaxed/simple;
	bh=ghFCm24n9EX84pv9ht7fgPi3N6gAafup6mFXdGxD8Io=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=a7E8UI5a2FAXrbQW0968U7xbvhggdbjJNHojlD+hc8+F7JYjY7hMmL1BweLGHgraKClNkUINDYp855x2ll4O6ok/BbXr/wPwFsm4wwgXNhLUubwzxtQaoYyhuP2cW2biYoADyyz0MtWAkCbcSKXPFGdG5sQR7Xo0zHuE/A4RGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ddYXnLK4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=S9+Fsepvgfm0QDrphfBJ3nB4EuteChViF5GpewTHHG0=; b=ddYXnLK4MB+Bhxl8qY8kPu3cfn
	w9u7HIBHI9+N9WcHDMG9MWK/XDbvOsCSVbHmKcmGJUtkeYz/ISpXk7AtHaDZDqGJgiec+3vHwkIT7
	tUtzfvDo1plsc0KbcKYmQarRXFBa8clNmhSvCtz0Inic2GRdiL4HUqVOrthkDhn6+87Ass25Buhqt
	5nk7vqLWRy3EhMydMHp4Vy0eXveRile4xTXBjM/5EOteVdXRJpHIx+WGVSrPoTLA92OPY0BGwYLYG
	VoqX1DeswIYw8N18X2xhGwxXezjvMZcMKW0pR+XFSAdwol6JkS1hHyiht+hHE06D8qoHtdRyuPHqs
	YHNaimEQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf6mh-00000008mwh-2SHA;
	Fri, 25 Jul 2025 00:59:39 +0000
Message-ID: <211effdc-774b-4c59-9643-c43b058350cc@infradead.org>
Date: Thu, 24 Jul 2025 17:59:39 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: xconfig problem with 'comment'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

to recreate:

	make O=bld alldefconfig
	# enable CONFIG_NET, CONFIG_WIRELESS, CONFIG_RFKILL, CONFIG_CFG80211
	# with any kconfig tool or $EDITOR
	make O=bld xconfig &


I get both the prompt for MAC80211 (depends on CFG80211)
and the comment: "CFG80211 needs to be enabled for MAC80211"
	depends on CFG80211=n

Other config tools (menu/n/gconfig) don't have this problem.

I'm testing on linux-next 20250724 but I don't think this is a
recent change.

-- 
~Randy


