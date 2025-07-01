Return-Path: <linux-kbuild+bounces-7812-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3989AEFDEA
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 17:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3440169624
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 15:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D3F23504D;
	Tue,  1 Jul 2025 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QQxqQFHV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4064274B3D
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Jul 2025 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383226; cv=none; b=GIXcWDKAJ0hmm36tSBg0/yR3CAQ7ePpxIUQFGsKE0UNfOF/b56QjXWp/uK3gEZAZI02WkEzucES6Vx5yv1OF9pOWBMsV/FQxZW4z2sks5nt7Hr9ZHS5NABphtuQocpbzJmFaGxfgPg7Q4RtwgaOxcC0ueLViSyFKUyuCdQfpCRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383226; c=relaxed/simple;
	bh=4HxDKDVDuqVFjjRQfc2NTTjXMx7SXDrod/9PZy2w8QA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mWvkV7WAPAfX/wWYK3RBVo8UuTh3kgpN/WYSXpMHauBRYTOYe/lvL1j76FChja3wuMFgt9KG6PtvEDD/cItDOWr5X1hbpzOpMN6gl77Z2XcublCl6MYKc5pbli2oUeuIWSSFF1PHKcTlxO94c6xmD1D76W1Q4IR33XIL1fFKJDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QQxqQFHV; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4edf5bb4dso3820847f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jul 2025 08:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751383223; x=1751988023; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HS0leYMDlHYokYSQ7rOzdx0mYa3EoAXRbAoaC0gzq8o=;
        b=QQxqQFHVsJA3LIg146JX0V3i8xK8uLjncfhhNg2/xvlaH0sRbI946Y7q46aoJuExkr
         FrXctz80G0HaYUe+MivuMKrl6Z3tzzJKUHvJPjhBg8haPDjDLcmdQzra+AsvJYzHNc/D
         w9b+3z/hp9i4I5HSM3LyKRqZuIvymj+5K8tUj7QheTj9gYFXzdCnlu4rbO+ugYAfnciI
         xUu/ZSyL7uDz6Rf4+/LCypO86D6YVocLGTco8X541wZgM04xpKgwulkyhYAfXEOfbqKj
         uuMMzCf+oM/gQUCWev+Rm/8LzrVRV6rNttKvgTGO1GFuKtHFvqRvB++XU0mt0DZdq18L
         VgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383223; x=1751988023;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HS0leYMDlHYokYSQ7rOzdx0mYa3EoAXRbAoaC0gzq8o=;
        b=OhYE5iP7W4rV4N1+3BN2ux6oIWhCGJ6LojwdIRaCUH7A6CyVEhuo5LUH1IK59BqE/L
         gqxs55rSoa/N4mH7whcet1L06Gm8JY7toSuvzJXKd3Hh6Rw/4Yps2x8uaTUBnRFQ/ni7
         oP0wfV92sbS2kMNMRHYRmi0FxV2mAAh2H9ahA1KTLq+bkikh1IHSVA6xkwnDZ6SWVdan
         Niyo6cghMeGgth4v6abTjvPb/OuJGRlFVl8JrTF/RDgafRU0A8oQGsOGeeUY+1AzdOXn
         POqVTzFKS7lV4hpS63dpPqnoaMoMfzhiyXM5bFvZ2iop4yLRIopF8anJKivQ+aLnS3mO
         ZwhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP52uq0GZ7WBzZUnVqGjWcFn/3k+O7Ub0JTlDdD0+BnZary/CMw0lzM8MoogupjpQ5TEML+4igIKIZ5Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyESBQfVaT2ymS743A+D8C5/PdU7nE7PfhZh4LAgFiHAXyPWps
	5xfge2LwBjlyoFxW/YC0PjqKDPFbMXNCEmio8Hu/3nmywLX1F/lxe4MYIbCqt4rM5xQMTy+5vAK
	Go0z5IlLZiWvgrA==
X-Google-Smtp-Source: AGHT+IFnMJ61wTYiwe+Gnktsjz4/HaiRP/F54x21/++tHXd37+SoOD+fZukTxHtrkdZFAOLWvY//EsBG9SDmAQ==
X-Received: from wmpz17.prod.google.com ([2002:a05:600c:a11:b0:453:8b14:6e0c])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:42c1:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a91818bae2mr10702455f8f.46.1751383223349;
 Tue, 01 Jul 2025 08:20:23 -0700 (PDT)
Date: Tue,  1 Jul 2025 16:19:09 +0100
In-Reply-To: <CAK7LNASzE1CtRo9T4byPXJtB-HtuWsGe=OLba+8JU9fB28Chow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAK7LNASzE1CtRo9T4byPXJtB-HtuWsGe=OLba+8JU9fB28Chow@mail.gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250701152000.2477659-1-gprocida@google.com>
Subject: [PATCH v2 0/2] gendwarfksyms - improve symtypes output
From: Giuliano Procida <gprocida@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Giuliano Procida <gprocida@google.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When investigating MODVERSIONS CRC changes from one build to the next,
we need to diff corresponding symtypes files. However, gendwarfksyms
did not order these files.

The first change in this series makes gendwarfksyms code conform to
the preferred style for the size parameter passed to allocation
functions.

https://github.com/torvalds/linux/blob/v6.15/Documentation/process/coding-style.rst?plain=1#L941

The second change in this series ensures symtypes are output in key
order.

The series is marked as v2 to distinguish it from earlier versions
where the changes were posted individually.

Giuliano Procida (2):
  gendwarfksyms: use preferred form of sizeof for allocation
  gendwarfksyms: order -T symtypes output by name

 scripts/gendwarfksyms/cache.c   |  2 +-
 scripts/gendwarfksyms/die.c     |  4 ++--
 scripts/gendwarfksyms/dwarf.c   |  2 +-
 scripts/gendwarfksyms/kabi.c    |  2 +-
 scripts/gendwarfksyms/symbols.c |  2 +-
 scripts/gendwarfksyms/types.c   | 33 ++++++++++++++++++++++++++++-----
 6 files changed, 34 insertions(+), 11 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog


