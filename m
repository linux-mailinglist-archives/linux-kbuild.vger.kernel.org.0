Return-Path: <linux-kbuild+bounces-8939-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DE8B97EE8
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 02:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EACCA7A7F31
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 00:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD671D6187;
	Wed, 24 Sep 2025 00:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="fbPsGt8H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4EE1C5496
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Sep 2025 00:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674646; cv=pass; b=Zs12wxZ7weBIBBAIOywtOpny8FQtlH3aRZDzjoRr6/LXTtnFdyFvhOGfb6vjmnzytOafH1h1QKoCA3iF+opxGU35H74DeJl/VyJ4Y1NJlaxIABt3Rhr98bL5jbfFruto9s7UkEufXE5m1ljVdQtbkw9xgiV85zR8IXoE66A5xrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674646; c=relaxed/simple;
	bh=EoDEGau3+y2z6DL16bzcO5D0jxZYSgM9oct1iOY0gAI=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=oW/UfU9BKxuSMUYH3vcBiL72+T/ttci0e5EO2kMbxK8sgZ80v54H9f8t+RYvfT8ziFo2xkgGVylwVP4i14uFTFOJArtiegMVHSzs9zbyU5OSKX3FLAN5TlKVxb3NyNj1nn9DTHlSG2XiFoNKAcUGS3MgDHJDNFXjA9VVbb0x9eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=fbPsGt8H; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
ARC-Seal: i=1; a=rsa-sha256; t=1758674643; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=tSAKcx3J/vUxjVwz8EGLI9rrxUb9Y9nbHp7Zlk8yYRVaKylXxhrOCzsjYFcm9OBPvlfLoYG02qKPyTGagUqm0Wiatjhp4uROau/kv5QYrkdW/TZrhMEgxPDiZkUj3vpl/U/yuWhBF9NN/5g83qx41FQ3HdrxKbAPEcccspRisFc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674643; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=EoDEGau3+y2z6DL16bzcO5D0jxZYSgM9oct1iOY0gAI=; 
	b=pdqkZyhv4XR//7Ou+1vAFTD5TLtcI3Q2WDrqgtk3kF+/F4yusv1l3TMpXBmWRzilDLtSTaVgUqYFyl0LLsFRek34zEzaT+yECF7s/Q6dNLIZRp6w83NuD6pIGLTmVyxigU+yv6hRnN+54YG1xQkWU9n+pJ8BIScD1WVm6B/Zlhg=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9a7a2760-98d8-11f0-ace3-525400721611_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671653530171.0560394145632;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=fbPsGt8HrYSgDcU1HZJVE7y30HsQuLyY9I0tSW9hUO1GkV0LrVhkp6lOWxovXISuUogJ2AiBMNwRYofAaSMktFkCy4mt+obybtqupiThJ5zeN5W3x+dj0TGYsPLP4+GVAxMqSLRpDcoGnnAt5t9OAuHC+2NiXKtl6v7gZS04XfM=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=EoDEGau3+y2z6DL16bzcO5D0jxZYSgM9oct1iOY0gAI=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-kbuild@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9a7a2760-98d8-11f0-ace3-525400721611.19978ffc4d6@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9a7a2760-98d8-11f0-ace3-525400721611.19978ffc4d6
X-JID: 2d6f.1aedd99b146bc1ac.s1.9a7a2760-98d8-11f0-ace3-525400721611.19978ffc4d6
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9a7a2760-98d8-11f0-ace3-525400721611.19978ffc4d6
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9a7a2760-98d8-11f0-ace3-525400721611.19978ffc4d6
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9a7a2760-98d8-11f0-ace3-525400721611.19978ffc4d6@zeptomail.com>
X-ZohoMailClient: External

To: linux-kbuild@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

