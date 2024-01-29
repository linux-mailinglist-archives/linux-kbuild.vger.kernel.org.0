Return-Path: <linux-kbuild+bounces-706-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248884017E
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 10:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C394D2812ED
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 09:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE36055784;
	Mon, 29 Jan 2024 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EeAwtiKT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E6455C2D
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706520454; cv=none; b=bXw/gpcOXd0QvxPLIgRHb+swtANnp8AG0NndQyrCCWKISL8qIWGVbK+41zD5H50XOIVyJIDqfEOW9GZ1z5t1JaMuisgMouZmAWhx4G7oiMPneyKtT89HnaAzsjZ3m4SJkOXyeT54GrpWWEtdAU/RHnOs1uTNvfc2GrAWuQBFz4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706520454; c=relaxed/simple;
	bh=hn9qNS4wUmMn0/IedVdqEWa8YsnO8548Biok/rcVaBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AboxXmCz2oIrDG5h0uSyRZMSvNBiTsne8ppF9MynsuI2tFn9wI4ANcO1KpEXzvMfDytPdQ9bbbe/M6OISoHlOyDf3LH7y7zyDuLDJsjOCj/g5XOANH/7rGJ97aj68ijNy3KoK55xoPfHwcQzyqtZSDTieJ8ZTLLNZCclXLmGKXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EeAwtiKT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706520452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hn9qNS4wUmMn0/IedVdqEWa8YsnO8548Biok/rcVaBY=;
	b=EeAwtiKT665HCr8Ri7smuZBPCObjWFRhc8u4E9hsrRoAfzgqg7pdMC6VJiZV1ykeN2/IDr
	dBdmC5YPc+dbBmCP/miR3Emtr5j1Ait5+X9Q7ukUkD95W1LUBjL6tDC9KyZcY5CXmxU9l1
	cbRhQIbP5RaHli+nCTVOQwxkvMQxJ+w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-cfSRzuhYOGiFnYj4rDjiTA-1; Mon,
 29 Jan 2024 04:27:28 -0500
X-MC-Unique: cfSRzuhYOGiFnYj4rDjiTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F01D61C05EB5;
	Mon, 29 Jan 2024 09:27:27 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C876111E6;
	Mon, 29 Jan 2024 09:27:25 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: masahiroy@kernel.org
Cc: dcavalca@meta.com,
	jtornosm@redhat.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	stable@vger.kernel.org
Subject: Re: [PATCH] rpm-pkg: simplify installkernel %post
Date: Mon, 29 Jan 2024 10:27:20 +0100
Message-ID: <20240129092724.10064-1-jtornosm@redhat.com>
In-Reply-To: <CAK7LNAR2xDjbn+BZqUrgbDxPJUyQBULFB51kTiN8Nc78DXVyEw@mail.gmail.com>
References: <CAK7LNAR2xDjbn+BZqUrgbDxPJUyQBULFB51kTiN8Nc78DXVyEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Ok, I will simplify the check to copy as you say (cpm --silent returns
error if file doesn't exist) and and I will limit the indentation to the
modifications.
If you are going to modify the rest, I think other style changes are not
necessary.

Thanks

Best regards
José Ignacio


