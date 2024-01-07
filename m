Return-Path: <linux-kbuild+bounces-485-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E2E8264B2
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jan 2024 16:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B92051C214A3
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jan 2024 15:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA05D134CE;
	Sun,  7 Jan 2024 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L2imbePR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C32D134D5
	for <linux-kbuild@vger.kernel.org>; Sun,  7 Jan 2024 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704641154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylOv8BQBQt2VBif1MnRK1t3TEEf3M7l9VEdncX+QjJw=;
	b=L2imbePRzs0A4DqzMqmfD8zbaxC3wlOy5lijpZGHyrmciZN5XJ6Z1EnR/7wHOf44hujIC/
	YFTA1dOyNEbzCG2HoG1wIlQuMOmvJiWquKTMiPNPh3N0LbG559Q7vr0/Niii3CKOvSjUV5
	O3GDM7HQfBxc70FaIuScu/duuwV9rWU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-NeqLaP77OfCcKSj3qjZtbg-1; Sun, 07 Jan 2024 10:25:48 -0500
X-MC-Unique: NeqLaP77OfCcKSj3qjZtbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23B00807F54;
	Sun,  7 Jan 2024 15:25:48 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A6641121306;
	Sun,  7 Jan 2024 15:25:45 +0000 (UTC)
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
Subject: Re: [PATCH v4] rpm-pkg: simplify installkernel %post
Date: Sun,  7 Jan 2024 16:25:42 +0100
Message-ID: <20240107152544.9091-1-jtornosm@redhat.com>
In-Reply-To: <CAK7LNAR_wgQBs-q9NH1icb_FPBoVMNEhQpvV8qzH2dFsrDS0pQ@mail.gmail.com>
References: <CAK7LNAR_wgQBs-q9NH1icb_FPBoVMNEhQpvV8qzH2dFsrDS0pQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Hello Masahiro,
 
Sorry for the delay in answering, I was on holiday.

Good catch
Ok, I will create a new patch including your suggestion and I will test it with Fedora, openSUSE and others if possible.

Thank you again for your help

Best regards
José Ignacio


