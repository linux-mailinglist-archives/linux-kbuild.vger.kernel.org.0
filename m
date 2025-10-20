Return-Path: <linux-kbuild+bounces-9217-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B89BF1D08
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Oct 2025 16:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5D4D334D91B
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Oct 2025 14:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349431F30A9;
	Mon, 20 Oct 2025 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="NkDWzw97"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E48301013
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Oct 2025 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970157; cv=none; b=H8ERqm1ojr/k/cY4HZtKCIzd47T7lZ84Q1bkV8Q0dLjZ9bkX4WTPnd0t7Dq7Uql9C5/GULX+DqiJxYnOyF5TV8eWfTvcoU3xdNkLUoecwxnxlMi3zJN1iPzR2yC1l32MYnYGbDWMzGJTIGlIUC+7egsB5I9MCCMV1p+xiV6cPvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970157; c=relaxed/simple;
	bh=Oz4IqpFgqpBt3xWql4AOJbfiltk7mMhCp0ZyesQbAQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z+LCi1AemdfE0NJVHPi6RLP/8pe838mNI84Cp9e8otOGrZSh9drc2eN8odeIiWgC0f28iCI3+zCKxnrqdzybKlYwWsfDDk9wg7wpXD1+p8Dh8matuNFO7h4RsAsnn87RZfK3zu+G5XCN0LCndTZFqWLmqn1PfTnhRlQgRQFFWqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=NkDWzw97; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57a960fe78fso5783536e87.2
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Oct 2025 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1760970153; x=1761574953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cEsM2UDXWcIxZXOopZ40CiWy0qeR73LhkBnbP4PEKh0=;
        b=NkDWzw97AYFNYcr1z3tdhfLkVNCuRlWEFtiHbZ0gkgVXk/OfsaOjLNMnPpikFcZr0l
         F7atKQNcshb3sBml2yDmIqEF1ZDVKQ/5ysqP+YqSvq+3KbhJQ1dk/+ns1EHHl+n1n8Wz
         FzhqnaekDh9t2XD7xIwOLroSWPDCJcwFVzdcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970153; x=1761574953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEsM2UDXWcIxZXOopZ40CiWy0qeR73LhkBnbP4PEKh0=;
        b=EiuORczdYNdczTk+05BU1+YVF2nPc9/zp+xSu/WnzY0rVR1oZAdg4taF8VJUbu/jKw
         MggbsXGk4rnt1Owpb2WpnjX+fFK7M5jvXPQt03hct1pLiX1tUMv3S09MyE0yXI7gstR6
         TlUnmoSDRdBQaZHPAAK+uOADH7lw05MQLXwb2//PGczdx9zQw6xyu/+SfWtt/NNntkEk
         pZBsKgj1tznjBAxR2oBwGiIKpSHRuY2BcrEP39UrFVR8eL+k0Z+UWf7D3vOUI0uJ/nYP
         Ziq/iAyw4bV3nwX07+9pW6I/NW2t9DvuDdxsDUkSnHpUXUlTSl7rYm0FsZCx4IkWsccD
         daVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHL0S3RLBxElYDoVaufuyV0LXpM3edWogHNZXnvDlVP/cjN+2expoc6Lj1lF1a41etaTkI89yKJwyP/FM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAxSP0CcNzh3mVwfc0Lzuh+DA51FEDVdcA2XjE//E8Sz6C3ETk
	H9zp7/oOV7mzXyNxr+LSb3919rx8EXsrGHQ/gLdq8AEBshPEOSlxIWEen0/kChvT7z4=
X-Gm-Gg: ASbGncsipJ8SeSCZdnertVJEa9gIOkTD9WArMC5L7AKBRG/obuzfioDFIzaTUcGPRAz
	MYxXPXzMcUo7Ngc6JUFUT+DeR6K2s3mnS4lWlhey0Azb67DtqPCXVJQKda753aHI7Cz46dbRB3a
	yPHdIluzADkEmFORNEfu5PZaZf/sbzA9bpK2GmPWaC0N+2YJevp0n2nduRWpN/qijcXm+ijCcn8
	Rjbmmu3NKyljRJDf8SG5apCStvNnTR1QhAJ6kWX4EPa4s+9i2318elN+VFZ/F+kOoB3r2vdVsi9
	RYmcGx0AjmTkUvnlckpLKFbuXjgoqJhC8KxfgkXg+PNz77Val0iUa8EXKalyHFrFg1IANOFk/de
	+HM4jLx8z0XvjtmfmbsSuaRXmjJQzQkaK5NCnLZJz06ZuLlkW3j69UeyFvvzmIqhlakym5tdUST
	5uPXo=
X-Google-Smtp-Source: AGHT+IH8CITSDcBr5jj8af68sm6VIVnQn6PvilfsQL4jwYaHj1901Cy23sK3Zh+yLzraL0p3PLkNPw==
X-Received: by 2002:a05:6512:308d:b0:579:f0fc:46f7 with SMTP id 2adb3069b0e04-591d8591a81mr4103987e87.56.1760970152552;
        Mon, 20 Oct 2025 07:22:32 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def16900sm2568436e87.56.2025.10.20.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:22:32 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kbuild@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 0/2] Kbuild: enable -fms-extensions, make btrfs the first user
Date: Mon, 20 Oct 2025 16:22:26 +0200
Message-ID: <20251020142228.1819871-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since -fms-extensions once again came up as potentially useful, Linus
suggested that we bite the bullet and enable it.

https://lore.kernel.org/lkml/CAHk-=wjeZwww6Zswn6F_iZTpUihTSNKYppLqj36iQDDhfntuEw@mail.gmail.com/

So that's what patch 1 does, and patch 2 puts it to use in the btrfs
case.

Compile-tested only, with gcc (15.2.1) and clang (20.1.8).

Rasmus Villemoes (2):
  Kbuild: enable -fms-extensions
  btrfs: send: make use of -fms-extensions for defining struct fs_path

 Makefile        |  9 +++++++++
 fs/btrfs/send.c | 39 ++++++++++++++++++++-------------------
 2 files changed, 29 insertions(+), 19 deletions(-)

-- 
2.51.0


