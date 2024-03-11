Return-Path: <linux-kbuild+bounces-1213-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E48878507
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Mar 2024 17:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 317ACB211EA
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Mar 2024 16:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA1D1B599;
	Mon, 11 Mar 2024 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gose7i5D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14745B683
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Mar 2024 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173945; cv=none; b=jsygwCBUNfSyRB9AwsepzItsGJlU8CCLEyxN5hbU4mMyHeHnqLpo4WQtd0+j8OIyMqf+EOXqsmziiI4z1gHqWIikFI++xZPeFjf5Rnmrp+BKwDCsAJU0NrBDaFSd2pZ0k4PrsxpwKRS/s9WTH+Ql0hor6iSTTNM7sGVN39EiJgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173945; c=relaxed/simple;
	bh=SpstfbDp4UHNXuv8wwg9k1v9GZn/ENsK2ri+ekeyzBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YIYlKnWHte7mSSw+crq6D+LNiMnjOEs8nbTNaauvLNmncLc+zNhTq9/ElSeR7/Rw682SQKhs5cf9AqpuVS0NXILDbF8zPKeVYG+xlEXcwM5Xkf5Fn3k4qBhHy1NebK/qzg2Jw6hg3ooGQj1J3RCBQXzgyf4EputqVapI/JFEE2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gose7i5D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710173942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SpstfbDp4UHNXuv8wwg9k1v9GZn/ENsK2ri+ekeyzBY=;
	b=gose7i5DiUlI1PtwQkp4JQWCUD6j9Rf77W/KoKTo8PVhRPIwrsnIz9Wgs5nn47TjnGrJTJ
	yDHpIOsxunwfLmrfNOZodvvUqbeFzLY1m0VCDHZYDUuRsdVxWK2DHStaDIVEkGAEgJBHK1
	ixOvaE0A7BNa9fFHOoz0V+aWwQ5nZy8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-qpyiyqDENtWq0-J3PfToOg-1; Mon, 11 Mar 2024 12:18:55 -0400
X-MC-Unique: qpyiyqDENtWq0-J3PfToOg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A87A2188497E;
	Mon, 11 Mar 2024 16:18:54 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E552D492B87;
	Mon, 11 Mar 2024 16:18:52 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: masahiroy@kernel.org
Cc: jtornosm@redhat.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Subject: Re: [PATCH] kbuild: rpm-pkg: add dtb files in kernel rpm
Date: Mon, 11 Mar 2024 17:18:48 +0100
Message-ID: <20240311161851.1760965-1-jtornosm@redhat.com>
In-Reply-To: <CAK7LNAQ6_kr0Q1RB0dELiGUObFJ4HEEu3XTErGf6FaNntKMnTg@mail.gmail.com>
References: <CAK7LNAQ6_kr0Q1RB0dELiGUObFJ4HEEu3XTErGf6FaNntKMnTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

Hello Masahiro,

Ok to everything.

Thanks for your comments!

Best regards
José Ignacio


