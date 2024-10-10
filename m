Return-Path: <linux-kbuild+bounces-4027-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3088998283
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 11:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F35F1C2534D
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 09:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D621BD508;
	Thu, 10 Oct 2024 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t3mjSE3A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D091BC097
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553118; cv=none; b=C0epMFLh6IJ6WxYBLUd9aNvJxI/kmGGCw1GRdxwMZjOGFyV1M4D3ZYQs4AdzJD3vdrNolIXgmn6bKHa77uxfjHl3nriBGkTmPt1aJ+3zdR5EcAu22dAw7raDTgMrxFVEj6zZeOK6X/rvSyeMaCAirX45dO4aikrJUhOl+qlfH5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553118; c=relaxed/simple;
	bh=LGl5v64OdaSMCvZyhXlX9gOE4oO4AJVSVwQjgTem8xY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tydjNSssu2n+O72gxsXcmh6SugUeaHThVqmqWzftaNIw5extgTXLby31TQU2+ygoB+nB+YUgVJZTnwuv9Ui2qJ7Cd/AgstJ3VpXDW+130aUbsDf4gim2M1K+esqDcy0GcKRqoAAEfcps4nXagROOAsXSG433uj0Cge+aLmo6jBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t3mjSE3A; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e31e5d1739so15404137b3.1
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728553116; x=1729157916; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3JrvS7ZL7zZ+JbiSh4qJJvQSqhwC8oRf994IWaVyGGc=;
        b=t3mjSE3Ac+b8952KtzLouD8WZaPGF6gxc81LV/7KXPcWAKkqzraaBBDe7YQjG0TXkT
         /faZNahhlM/cIwt3keP0wSULlGaNTPLh4ehUwPfBuksj9Md61T5mwtzDg/Ng5IYClTp+
         oc1mt4twiywuiJ2QTfAt0mFUWwF3Ew41n+ZzJBNKZYhq+FeHlRhzMLisnA93r+tZf0C+
         w0uUwn+Jdp6mDNEIt//q0Z6+fhwGe1QQOqsLlE6OEjEYMNvf1RBthDLbq11R4SthXeYw
         g69ysgfaJ9g1csDBo0tBePQcJulpyOVeNZl5unXGrCiyP7VnSQmrD61TV4KpR2AU5uRH
         pe+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553116; x=1729157916;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JrvS7ZL7zZ+JbiSh4qJJvQSqhwC8oRf994IWaVyGGc=;
        b=ueludIFirQkkImRcBMPLcfFSN8ikqTjk73A0xlZoerFFRFDHxC7/+PdzDYCITKH0Eu
         7/f6eJSKTogUC5la6/Fl3RB2DP+cqWUBASpYKsDzItvHduhg51HZtisrlcY/KZcL9n4/
         C/8Zolxwxf10aU5Lw/7byFN9zPKt6+yhw2w3Nqkqrgu1SAB0J102crmcHYwZ0R9Nweaq
         sg+WsMSoHxYSiAj1JOdntrU85mZKgO/UGbtcEeHY/rRun3HWBC16qD0D8ljdbSxngiuz
         d3eDz2T4f3jIe9dNS9GLfm54fL1o3ZmHTNsaFTNnF0V+sp3+X9isgDRE4N/oyt5x6nAd
         0xkw==
X-Forwarded-Encrypted: i=1; AJvYcCUouEjF7nCkbuqeky0UNIMrG3g4fpT3sGiGYmIefKz37U0ga1dIH8eDKeKsIorXVrViTmnM4Wae9huzhwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyox7WoP8AzkZfhAhnnCXDNchjpWiXo4txU4v+9nJIHE3ndNgYR
	m0b67sMDPzYhitLTbx4odJPo+gIXycAUTCgliKNfbZDojJKGpznRO2WyvKuJ0M04eWXsQQOnnXS
	ov8Qh6sje9Z68rw==
X-Google-Smtp-Source: AGHT+IFhzGY5t3RkyXoIJV0d1EOFgaxtw5njawDVgbAaGCAdITCJbDElc3h7tzDkVGhbspHmhomdM4Hhz71cxBg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:4281:b0:6e3:2bc1:da17 with SMTP
 id 00721157ae682-6e32bc1dc1amr499067b3.4.1728553115778; Thu, 10 Oct 2024
 02:38:35 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:38:25 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJGgB2cC/x3MMQqAMAxA0auUzAbaKoheRRwkiRooVVoRoXh3i
 +Mb/i+QJalkGE2BJLdmPWKFawzQvsRNULkavPWds86i0hICslxCF96SMvYDeaaWuHMMtTuTrPr 8z2l+3w91fDo+YwAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=778; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=LGl5v64OdaSMCvZyhXlX9gOE4oO4AJVSVwQjgTem8xY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnB6CXpiAgpO06WePqhI7wIEZSiscJcvGy/If/7
 3KVs6ACM5aJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZweglwAKCRAEWL7uWMY5
 RktWD/9SpAYXqZHXhNSIniY2ws6yScZqR5wRrCqUJtVHBNLOKqw4Dp8vAwve/18pzRMmPpvwx1p
 2QO8gShh0uMKct8VIDW2QuGZqRNolmlOZ9+kIvPqA+b3mApSnwI7a8uCX6a+3d/TI3S+ExTN4hw
 bSW6UdpqsOzsiPIb27tkLIm1Em5LPF44KqZ6xhhFvVNrJsAKyv9iaDRsVTjqwJ9dImdqPoDj/5R
 LRVyoilklHhQvsAMPDkMGzMYC4XQTmqmLhWoSiPTKJXRvvkG0WlLr+8mjlfipLvv6mXdT53LqAK
 Zz7f964P3L+33xB1Ul6y555EBO2YTVf0uuEYx99UTcDM9tmL6ytSv8lkR1hqk/nCR+xwHUaAqKJ
 OsW5xXbQayaohCFTi1B3XdmhpSy+3hWyLuL9rOagP5ARsWHRT7rZtscahS5hCI+MGz369cbkkQL
 fTk6O+SmRru522Dfk8ZBzReicGS8ZHO27uN/bONlWvi4URRhzndjPel09OQlBWbj98UZgfbQ+cm
 BPVIEGrUJEZCJ58976wM0fmsr5IKGwFK4tlpUBp1Bx/G0FkvdCVo/54tuMSNPy44GIK7D2dmHa8
 HP+PMTc/gZYzoZEtkxnUz3Xlom4hJxSqJ+Luxldj9EymFzNWVcaLf30ts5LS4nOw/HPZfe94Ldj UZKkGoV0asyqb1A==
X-Mailer: b4 0.13.0
Message-ID: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
Subject: [PATCH 0/2] Normalized CFI integer tags Kconfig fixes
From: Alice Ryhl <aliceryhl@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This series adds a config option for the LLVM version in rustc and uses
it to fix the detection for the CFI integer tags constructors bugfix.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (1):
      cfi: fix conditions for HAVE_CFI_ICALL_NORMALIZE_INTEGERS

Gary Guo (1):
      kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`

 arch/Kconfig             | 26 ++++++++++++--------------
 init/Kconfig             |  8 ++++++--
 scripts/Kconfig.include  |  4 ++++
 scripts/rustc-version.sh | 31 +++++++++++++++++++++++++------
 4 files changed, 47 insertions(+), 22 deletions(-)
---
base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
change-id: 20241010-icall-detect-vers-79c2dc3cd41d

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


