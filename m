Return-Path: <linux-kbuild+bounces-598-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3484831B2A
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jan 2024 15:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CAB528AB9E
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jan 2024 14:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AC925772;
	Thu, 18 Jan 2024 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WOemJyKS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F9F2575D
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Jan 2024 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705587177; cv=none; b=UgCw7b6H2la5i3pl6y4DifWtXguQImY1Pg8e3M5rez5LX/FvaVxAnimDTMaxVugbYcy6Kt7Pz+G/u74O6V7LIFlM7Yx+2aPglYeslU6/pRpjd3AVwz+KDrtvZy6M57P2LFHkyNWA3jI50ZhnS4Cy+iYJe9jXA1fTcLeSaGY2VTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705587177; c=relaxed/simple;
	bh=HxSLrYC+hnZMNQE8N/YqaKMukOyUuO+/CWYaAZNCBK4=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By; b=oPjmeBnmehHfRZqUZtdZn8jMweVedPEcB+GoBeXf3l6cuYUJ3/G2IWy9aRetNxFBepWWm9y/6aGT55ICX8++MZQuL72XeWHa+znSldiQwk0pTguQcx9DTRUWYyRqC4TBx2bSUaPDySgm9VOa/c0Jky/56vXKfwaoNPB3zQOsizI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WOemJyKS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705587175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C6daif3Wpo6oR6mWR0a75zB3XL2N/MWmItaHsVRRCfY=;
	b=WOemJyKS3bPYDrnlMZ+HoIbfwFPaDS4TcqlT3X9gBlwDCMlEbwdb9nZNzV1814BHmloyXd
	6HO1922sqQqVJoXb6QHiPDM7zKlw78PHjy+wpZ2ptW7B3+fLw925Nmx/3GXeZgLUcH+aqx
	UxNf5MsPgiSiNi1YAuccO7q7qY4laAc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-xgcAbzp2MJGxL2n8EKgOGA-1; Thu,
 18 Jan 2024 09:12:49 -0500
X-MC-Unique: xgcAbzp2MJGxL2n8EKgOGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C60D3C2A1C2;
	Thu, 18 Jan 2024 14:12:49 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D15D2166B36;
	Thu, 18 Jan 2024 14:12:47 +0000 (UTC)
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
Subject: Re: [PATCH V5 2/2] rpm-pkg: avoid install/remove the running kernel
Date: Thu, 18 Jan 2024 15:12:45 +0100
Message-ID: <20240118141246.370272-1-jtornosm@redhat.com>
In-Reply-To: <CAK7LNARX==sMKVTGXutGMmMkfg1idGUYLhBLZvKZ0psdwmiUvQ@mail.gmail.com>
References: <CAK7LNARX==sMKVTGXutGMmMkfg1idGUYLhBLZvKZ0psdwmiUvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

> What is the problem with this?
In my opinion, it is risky to remove the kernel that is running, that is
the reason why I am trying to protect this.
If you try to remove or update (and the running kernel is removed), if the
kernel and modules are already preloaded in memory, it could not happen
anything but some extra action could be necessary or automatically started,
and even the new kernel could not boot.
Fedora and others are taking this into account with upper tools and declare
the running kernel as protected avoinding this action. But others
(i.e. openSUSE Tumbleweed) allow this behavior.
It may only be a safety measure but it can also be beneficial to avoid
problems, just in case. 
Besides, in this way, all the tested distributions would have the same
behavior.

If it is ok, I will create a following version patch describing the problem
better and using indentation as you suggested for the other patch.

Thanks

Best regards
José Ignacio


