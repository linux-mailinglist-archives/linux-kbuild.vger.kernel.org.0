Return-Path: <linux-kbuild+bounces-6860-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6874AAA70FB
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 13:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 044AE7B5CF9
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 11:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0573242D7C;
	Fri,  2 May 2025 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.co.uk header.i=@amazon.co.uk header.b="BjcohYjW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506BB230274;
	Fri,  2 May 2025 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746186965; cv=none; b=X+5Myw0anM2AD/VbL7Wu0gYDoEgX2w7ESvLRk1kBps0eUxfFwpQd593YHuzmJUDccM/0dTWCJ47ZnXjdKVKy3AO0+INifVzGHTGdFnKGu/DnVV2TIaBYqaKYlxO/2SySEAubCsUhQRaNBjkoUs66zB2HnTdEgeyHBVHDeWL7LpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746186965; c=relaxed/simple;
	bh=th3344aMAWm1g8rAJdfWFaFTsrH6CqeVGZ3Rm/J5k0s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UBO4qdJByxTdITi3V0ET/Hih9BFBCR+Wmob4cIoxON/rKqROI8wpt+C53OlyBQh2gZlP5xw1wwAKWDbYC8x8Fq7DPa8CCK2X/V+5RcWmp2OBXyGLWiJ72056g3KpBNzDFsTEGMyun5Y02krMMKEni8Y76ZDAhNfNxwz6NVSXfjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.uk; spf=pass smtp.mailfrom=amazon.co.uk; dkim=pass (1024-bit key) header.d=amazon.co.uk header.i=@amazon.co.uk header.b=BjcohYjW; arc=none smtp.client-ip=207.171.188.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1746186963; x=1777722963;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=th3344aMAWm1g8rAJdfWFaFTsrH6CqeVGZ3Rm/J5k0s=;
  b=BjcohYjWSatgbRHWoLMUMjel4sF8nq3vfII3KyGBY6iUl9Nr313SqAsy
   WushhCqbnncADPfrsIeNrBjdSDx7qtOhrexpsBTha54ewc+oqsjbYsMh9
   hYOxtkARGsC4BdvCAL4SN5llp++cFV/OzH97cPjpaeJO/wcflEpdGMzsf
   s=;
X-IronPort-AV: E=Sophos;i="6.15,256,1739836800"; 
   d="scan'208";a="821084632"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 11:55:56 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.43.254:62585]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.47.43:2525] with esmtp (Farcaster)
 id bc906e87-2d5c-432a-b5b2-76aa28f1987e; Fri, 2 May 2025 11:55:54 +0000 (UTC)
X-Farcaster-Flow-ID: bc906e87-2d5c-432a-b5b2-76aa28f1987e
Received: from EX19D015EUB001.ant.amazon.com (10.252.51.114) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 2 May 2025 11:55:54 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB001.ant.amazon.com (10.252.51.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 2 May 2025 11:55:54 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.1544.014; Fri, 2 May 2025 11:55:54 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
To: "peterz@infradead.org" <peterz@infradead.org>
CC: "da.gomez@samsung.com" <da.gomez@samsung.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"hch@infradead.org" <hch@infradead.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"masahiroy@kernel.org" <masahiroy@kernel.org>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>,
	"nicolas@fjasle.eu" <nicolas@fjasle.eu>, "petr.pavlu@suse.com"
	<petr.pavlu@suse.com>, "samitolvanen@google.com" <samitolvanen@google.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: RE: [PATCH -v2 0/7] module: Strict per-modname namespaces
Thread-Topic: [PATCH -v2 0/7] module: Strict per-modname namespaces
Thread-Index: AQHbu1kopZmcI7TbRkO7lgxrIG0DyQ==
Date: Fri, 2 May 2025 11:55:54 +0000
Message-ID: <20250502115553.27803-1-roypat@amazon.co.uk>
References: <20241202145946.108093528@infradead.org>
In-Reply-To: <20241202145946.108093528@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Peter,=0A=
=0A=
Are you still working on this patch series? I'm working on having KVM remov=
e=0A=
virtual machine memory from the kernel's direct map, to harden again=0A=
speculative execution attacks [1]. At David H.'s LSF/MM/BPF task on=0A=
guest_memfd, it was suggested to use per-modname namespaces to export=0A=
set_direct_map_valid() specifically for use in KVM to achieve this.=0A=
=0A=
Is there anything I can do to help get this across the finish line=0A=
(testing/etc.)?=0A=
=0A=
Best,=0A=
Patrick=0A=
=0A=
[1]: https://lore.kernel.org/kvm/20250221160728.1584559-1-roypat@amazon.co.=
uk/=0A=

