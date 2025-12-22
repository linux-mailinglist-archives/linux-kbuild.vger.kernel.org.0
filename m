Return-Path: <linux-kbuild+bounces-10325-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC8CD711A
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 21:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E775301DE1F
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 20:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CE933EB02;
	Mon, 22 Dec 2025 20:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y12L78Nb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E718233D51F
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Dec 2025 20:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766435105; cv=none; b=QevgzYtYt3esioqEyPVHVAykN08JT41olUdyhomNI00WW1XU9IPI1PSkS0trJsi9tSYwDZEWIF9PGE80bNg30Rd9Er7EzODFEw7XZHWX0hJza4zcbxGzrdYCvmKNf2d/qJms0qs1P7QtmR71G3jFBYKuwdkLoEWhuu04YLBDsns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766435105; c=relaxed/simple;
	bh=5vKUgqBCNF1LDekma5yvbKYae+0DEYAyK5zxUM+aX6M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AVs0eZYxCzZObqm2z6F3MHPjZ+c2lOR1SpeFNdTgWTlpT4xdEK5E5ou8jmwnp0Brji9WQV1YDG1xgpY6H1zAj/NWQumZImOcg0LUE8YdXuWjE5WeKGLIteSUqxqXlCPe8K8KcbMxRNRlyzdLvmXVFpBcAs+EsRIfMcl/QbgKvXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y12L78Nb; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a089575ab3so55669095ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Dec 2025 12:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766435103; x=1767039903; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E27YczOdHNU89t7q7TxvUUS7PbVE+xKj567xdhzkzYI=;
        b=y12L78NbqHKOUUqRn/rX28laIdYTxeuuG8goVV+T2XMhG2hkd8HJUXXpm1//znNqBP
         EyhMrtCzh4eKeBaAZsjRvbzBCda+FG3TYCKpAlO0r3pQR0tKUiSXpnWjiE83eEjOlvW5
         28B8D/3nu14xy7zLXXmnyvsJy4GFdG+quHqQhQjDuvEyP1EBY6y5jC1H+k8GStCfvO2m
         Syw2mzKPSoyMZp77Zug3wy2jO2RhlTvFi24973/3ckkuSpUqUpVsPw6PKvaiJfPt0r9H
         9gJKC9DvAI2KJasDOdjyZWFNf/N7r0b/J/0Ne/jncxr818H6NunxMlp5MKJabPKynZfo
         Mh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766435103; x=1767039903;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E27YczOdHNU89t7q7TxvUUS7PbVE+xKj567xdhzkzYI=;
        b=wZFfwpMAxuv3GaK308hsEwGGXA8fRJPRBzqiyyOsXJSGxM+CIfDwjZLZ8OwH5C5SH7
         ffE7qaidkBK7ctZTCbppW74p+tThj/Qy1lROF0oExGOIydLgNUPctmiaeU08Rn5lXcct
         GBqv4tQLlhlXjwBn6yPOUaT9rGGDhdDbbkgwcikf23qnPZyoAeSyMMAGtKLroMNlNCdP
         NRh2TqoxrY5iZ7C1a29ypbiDIHmgqJa19SSGp1MoqxI3tDIvDXwzYoWY+gxAQ/sjeH91
         v/HET90LbmAc6bHYTjJMxsEzVHIMUCgoGJaG1sXNMRLgQVd4KjDYJFQ2CGWfImr0dpQg
         efvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPoHP3tCIzt+3wQY9G3pizUT2ciUMxgybslQeFBde/DzrhKEc+SmfdtYmGuhhBZyA2rmceg2Wj1bwv7SU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJx0ZfIQSSa/6af8Im1/Da2LrQz36Xy9FPk++iSHqGA46izslA
	9vjZP4+Ob/uXH1PwxGIeaJ1136W2DgFpdMp9rcQtn8NKaXZA6oXuq9IQzscvun6FmcmatFMCET1
	PMOjT9Znn4ufUxN+Wiab/gzyu3zgVmQ==
X-Google-Smtp-Source: AGHT+IFvSaM9jS7DN7I3LsVYDui060BWgvBYP+xtJR3/H3ZFcKHBdiLRxWpahiHe8WCNm7IWcehVx80zrl3Y9ydBV+8=
X-Received: from dlbca5.prod.google.com ([2002:a05:7022:4405:b0:11b:d4a7:e833])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:90e:b0:11b:8f3a:3e07 with SMTP id a92af1059eb24-121722a8dc6mr16297944c88.11.1766435103244;
 Mon, 22 Dec 2025 12:25:03 -0800 (PST)
Date: Mon, 22 Dec 2025 20:24:20 +0000
In-Reply-To: <20251117203806.970840-2-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251117203806.970840-2-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=442; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=5vKUgqBCNF1LDekma5yvbKYae+0DEYAyK5zxUM+aX6M=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDJmeK75t3cL3pEGJ7QyTcUkk74wu98LOhP5fVVdZvb7my
 DDl1WV0lLIwiHExyIopsrR8Xb1193en1FefiyRg5rAygQxh4OIUgImse8DIcJClcZ/+5hDmSP04
 ccYZjjvvqBgot+1yaq1vfaQz533jbEaGa4XK9Y6pF9QjfLpvzJdQt+JZoCCSfI91XeGTBae3neL mBgA=
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <176643400579.1902051.493530980407785307.b4-ty@google.com>
Subject: Re: [PATCH] gendwarfksyms: Fix build on 32-bit hosts
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-modules@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Michal=20Such=C3=A1nek?=" <msuchanek@suse.de>
Content-Type: text/plain; charset="utf-8"

On Mon, 17 Nov 2025 20:38:07 +0000, Sami Tolvanen wrote:
> We have interchangeably used unsigned long for some of the types
> defined in elfutils, assuming they're always 64-bit. This obviously
> fails when building gendwarfksyms on 32-bit hosts. Fix the types.
> 
> 

Applied to modules-next, thanks!

[1/1] gendwarfksyms: Fix build on 32-bit hosts
      commit: ddc54f912a551f6eb0bbcfc3880f45fe27a252cb

Best regards,

	Sami


