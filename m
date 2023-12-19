Return-Path: <linux-kbuild+bounces-392-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1EE8183A4
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Dec 2023 09:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E90111C23994
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Dec 2023 08:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EFA125DE;
	Tue, 19 Dec 2023 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VMwxbP7J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268D614A8F
	for <linux-kbuild@vger.kernel.org>; Tue, 19 Dec 2023 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702975442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YrvSxLZe9VcQ9K/emlKRK2E9t4qFRR6zMV18jSkIVOA=;
	b=VMwxbP7JZqrhZ1zvmnFqwHkTK03urzWPWrKoQbJUEomgOdQgFyse6S2ea91uD55JOJvhFu
	ys4q17GoPDDclJpLF0jOObCbVr4+3kkfmvJq8NQfm0V9jjomHFlxR2y9k8oDl4ej3yQrxr
	Bk9F4JM40r+FadvKq5JM8Xlk2Utgjv4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-eA42ncFKN6Ksu-0UYqq83Q-1; Tue,
 19 Dec 2023 03:43:58 -0500
X-MC-Unique: eA42ncFKN6Ksu-0UYqq83Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 197EA280FEC7;
	Tue, 19 Dec 2023 08:43:58 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 979001121313;
	Tue, 19 Dec 2023 08:43:55 +0000 (UTC)
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
Subject: Re: [PATCH v2] rpm-pkg: simplify installkernel %post
Date: Tue, 19 Dec 2023 09:43:50 +0100
Message-ID: <20231219084354.464320-1-jtornosm@redhat.com>
In-Reply-To: <CAK7LNATu-4TSSWpyFyVQYrkS++fUQbfp2tVjEpf3oZBV8ihq8w@mail.gmail.com>
References: <CAK7LNATu-4TSSWpyFyVQYrkS++fUQbfp2tVjEpf3oZBV8ihq8w@mail.gmail.com>
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

> Fedora ships vmlinux, config, System.map in the module directory.
> Why don't you mimic it?
> Change the %install section to install them to
> /lib/modules/%{KERNELRELEASE}/.
Ok, I did not dare to change a lot of things, overall in other sections.
I like the idea of imitating Fedora and making it easier.

> Then, change %post section to copy them to /boot/.
> If you take care of an unusual case where installkernel
> is not found, you can support manual copy as a fallback.
Ok, much clear in this way (and independent of software packages).
Again, good idea.

> Maybe, you can also convert the installkernel syntax to
> kernel-install while you are here.
Ok, that tool is more complete, I will try.

The next version will include all of this.

Thank you

Best rgards
José Ignacio


