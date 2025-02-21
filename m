Return-Path: <linux-kbuild+bounces-5856-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4708A3FCDC
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 18:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6AD53B7BD3
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 17:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBFB21E0BD;
	Fri, 21 Feb 2025 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="esKVWQ8V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mr85p00im-ztdg06011101.me.com (mr85p00im-ztdg06011101.me.com [17.58.23.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA59A223335
	for <linux-kbuild@vger.kernel.org>; Fri, 21 Feb 2025 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157212; cv=none; b=lCAeVkSxj1MVBkBj5JbjufM4ViASsSqjFT+TiaA2fwWeOgUAEFWJyPCYXhv/Q/8sU5nq+5h4IZH2bB3AQ6xBreYsyxmJEFQ0wz8d5rRpdHnjXkM59+cCuM4VKE9gbs4gVhkOBezpBODKOkswRSbaF1CMCyVJ8vfLFjtg9rES00g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157212; c=relaxed/simple;
	bh=LRLjnoPeYF6ilJFr8bD8PfFt+L04X0ykkN1u8Qbb7sc=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:Cc:To; b=T64cf0bYXc+v5H1vSu6GmC4yH4XnfQyxIys8Yp0Z9l8OfW6pMsRUiwYxb0meXIeJMBCM6+uGfCZ89SO2RH4yEoRGsGbYW8FHK7zTVD47UqNHUuvcDONBPL7y7KAD218U7h0Yde0zHdtZaAoH00TjGCI2Oy44gYYxKhQtbWhYnok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=esKVWQ8V; arc=none smtp.client-ip=17.58.23.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=LRLjnoPeYF6ilJFr8bD8PfFt+L04X0ykkN1u8Qbb7sc=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To:x-icloud-hme;
	b=esKVWQ8V4ak7wpeBevg37+9kVQPuDAo7vPIpDyGYonLK8HwxuaQpEvrhgPzQv7wNo
	 MBF9i0I7TgzY940DzDJCo8y+Fr84OZXHiVAcr8NU+jmzg3cD/qFa07FCNDcK+Z0Va3
	 Fsl4JJL3DXbrapeExxvC+nT0NwF0OowXd/C/spcnq1/1v6ekfNkFeXPh2W6BJLuJX+
	 aXajuonQ6SLQshZOyllB6ht7igw/pn/QA9Q2UHQjhnWxtWrrTJvxJpYto7HJnGNslp
	 7f2vSHETXGj44zE7oYNr19/o0hx/C2wttTltNJZneGYoZ5/QWANhKA2EtyJAaufGHQ
	 RKO2/dlbPTFvw==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 1F73CDA040D;
	Fri, 21 Feb 2025 17:00:07 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: MICHAEL TURNER <kameronwayneturner@icloud.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Fri, 21 Feb 2025 10:59:53 -0600
Subject: Re: [PATCH v2 2/5] modules: Refactor + kdoc elf_validity_cached_copy
Message-Id: <75A63190-F010-4CF5-B09D-45BF74FD3909@icloud.com>
Cc: gary@garyguo.net, laura@labbott.name, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, mcgrof@kernel.org,
 mmaurer@google.com, nathan@kernel.org, ndesaulniers@google.com,
 nicolas@fjasle.eu, ojeda@kernel.org, rust-for-linux@vger.kernel.org
To: greg@kroah.com
X-Mailer: iPhone Mail (22D72)
X-Proofpoint-GUID: WE4r5jYP7-uRAtXQs623InvNKiKYM718
X-Proofpoint-ORIG-GUID: WE4r5jYP7-uRAtXQs623InvNKiKYM718
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=643 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502210120

Remove everything that is attacking me this is invalid=20
All information. Has been stolen I=E2=80=99ve been attacked over 2yrs=20
Please stop all of this=20
I didn=E2=80=99t approve any of this=20

Sent from my iPhone=

