Return-Path: <linux-kbuild+bounces-2772-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9BC944D3B
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 15:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A66828BFD6
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 13:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4955D13D520;
	Thu,  1 Aug 2024 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ey9yG77x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886FE184549
	for <linux-kbuild@vger.kernel.org>; Thu,  1 Aug 2024 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722519345; cv=none; b=dkJ07aQ0CJ5l9m7GIOKHY4SRZ5SZrUpxT0h6goP+7SgGY0orGcvnPu9AVLTyO4LE7xnuAl/JOH4/V5Rjx8ZMBvlJdVEJG+v43aJ6pXsO19AH5TnDAxU1CxqY0SuY1BJi4F+dRmRFyMToo64hiiIlLjQKvOVzR3ZUZAmNMT9lqqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722519345; c=relaxed/simple;
	bh=6PWofOhzxWOsSvAQ4f4ZR2MT/oMYaRoPybNpxGhbLf4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=P3B6XzQCIhjr7BH9INJXl88su1ekyyGo5HzaVxGwgJ0rlulE0W0g5OG66cn1n5rpoJgj84wSHBgP3VcPlaYQDf9u5FlBixXgGOwx1TKGBMLKB/UYnUFRM6cFroGwmqRbXWmOTom8XSl70OseWTiLl+lZVfJGH4aQhUBq9qDXHwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ey9yG77x; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-42820af1106so28788855e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Aug 2024 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722519342; x=1723124142; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JCtVvQ3vIefwjR6lsV6OqLIp1U5nNkxO50HxvkieJlE=;
        b=ey9yG77xHKEBT5FPB41PqwLx4hXKYsWHM7MvyEKguqOZY2aZlCpNdAonvUu2JKaN32
         2PB1HPSDcKKPIlay/t+n2OAZSwOf5gHKaZ5OwHabFNXeO+zGf6i0WmgNCdMV0OLZ+X0a
         txj1l6HJ7N1F1npbVDa1gV0v/NpeJqhexZNN6dVOGRjSBN00H+WwKOd/psbP5f4jq/ex
         Vs3Ep7sYfrfLeOR4DUPVanfqPDLRSsM2XoFBrGJ3odnm2vD069kMF5PKAoumJt9sJakX
         llmYBvtCPkamzEUtA4JR08oSXwHz8Suuq1wM6iZWKrbr7lonwHAOAlXN3iD1epr1t4Fq
         Se/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722519342; x=1723124142;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JCtVvQ3vIefwjR6lsV6OqLIp1U5nNkxO50HxvkieJlE=;
        b=fdzYLJwJxsXPHEQIoJpK/7ch1dZw+y31BdLQelUbw+jsPtfNfIlaMmI4fDD93k/4E/
         DHUySvwvFV922+D5khD1fwYeh9u9YJePyiFKdVcxpy51sqtGWuZagIn7588Xjrz2Zmbg
         0ST+JlXNV11ipHF51Hj1xbQvTZeyXMBZfxGQLMWLfhURzDqD3QB9zEUcFG31ppCpeVpn
         wAXxURVFZ+MI6qE9v3a7fKR0MEwjWZKgrjLQrdLGFFZfnIo8GUFp6qPqppPv5+05zRXG
         d9Q/VIdDV0q+0xR2vaI1wc2AHA7LxR/9RionLa7vxdyNKWp+MhN0dPMiyh9bd4zohqkR
         5d/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2MIHKXbsXUuGg5BcCrmUyJIN2rHLbOcJysXNv+eNxIlOv4ii1qTlkAWYjVpgDSIm7dkXSeBspuO3zdPoY1owG/oBthCPYsHGAM1oZ
X-Gm-Message-State: AOJu0YyPUY8vZewhQ9kXYcxdx4jPZOW19avxWz2hwU62FqU2noXhhj8/
	3RiAkPIUOEyHQeCOtYU6INJGvV8Ib7j7SFAiO1i5IZpoqw3A4egHQwOc2UIzFMRKTGURAwrkTjc
	N9ON4XTXAup2uFQ==
X-Google-Smtp-Source: AGHT+IEshexJABfe0/r0FgPrhZK0VYH+/QNyJE4vXe+fblpyOSHmfGlpx/gKKzjUsEBFNNdRsaa4XfovaTEUpfU=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:4694:b0:424:ae26:8461 with SMTP
 id 5b1f17b1804b1-428b0336d3fmr269445e9.8.1722519341781; Thu, 01 Aug 2024
 06:35:41 -0700 (PDT)
Date: Thu, 01 Aug 2024 13:35:16 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABSPq2YC/y3MQQ6CMBCF4auQWVtTBhqoK+9hWNA6hYlKSWsaD
 endrejyf3n5NogUmCKcqg0CJY7slxJ4qMDO4zKR4GtpQImt7FCJm3UsrNLY657QOAPlugZy/Nq Zy1B65vj04b2rqf6uf6CRPyDVQgpjjG77TuHYyPPk/XSno/UPGHLOH1lxIASZAAAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=6PWofOhzxWOsSvAQ4f4ZR2MT/oMYaRoPybNpxGhbLf4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmq48ioaFkGuAGbLdiCLasAfpCQZc9PoSiOcj+3
 aXttgAHgwmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZquPIgAKCRAEWL7uWMY5
 RlXuD/9I8HgNuht4mYN20xTsRM8mcJfECVYTuDHtRHcswuA1HGJDm8WJnTnDwWG6VtwPGEdF6o/
 ePh7gRgNIqyl9CDSzyKoUyoZ2U+8oYKbvoEyZ2+LTHTu0MX+soXuOvuZsB24/ujajz1Kl0VH2OE
 7NATfm+f/xaaWg/waJdCCh13aDyL7On0q4iNAYG6tRi/DL9EYK1zyg2IN8mWg98IUJzG238PA+k
 c7S+bdXMA8hVw57LeXEQ9FLL3jX7BJ70Bi4HaclIKdCdsBRmAvnRkMnbMUutW9VY+w1lR8ydbK9
 TA58Cu8VYTspYxC19NIyTkBKXnRscvDwYtRHcMYwA8dzULLE5BSZfNQADzP0MVxfZ0McvwEDjmg
 hUojlopG8sjoanPjKADTFxhqXBbF/VR+e/Gbuh+IJr2EmzuAQTCZgNq/Rh98t6f3iXllvh9IrI6
 VBb1JremzwQ05zxvQjK5FYWQBKCT7dqasL+PlvhTb+PGuOEgs74nUsEuv88mcLJAAjSY1x4puI1
 M7J0+8pup6Z6ol8jebAHO+TYPieHKgGY+13pCBbpvS2yENtv0XC+Veo7nwBLlGRQT9eqLNgGV8w
 VDO8jmzewIbs3C826eo10UiudP7boe/UGfbNnYcMXsXoNGkIVI8Pdxv9EDS9dQknaWYUgPs3GQh p5MXvDXh10eFLhQ==
X-Mailer: b4 0.13.0
Message-ID: <20240801-kcfi-v2-0-c93caed3d121@google.com>
Subject: [PATCH v2 0/2] Rust KCFI support
From: Alice Ryhl <aliceryhl@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Matthew Maurer <mmaurer@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

The control flow integrity (kCFI) sanitizer is an important sanitizer
that is often used in production. This patch series makes it possible to
use kCFI and Rust together.

The second patch in this series depends on the next version of [1],
which Miguel will send soon. It also depends on [2].

Link: https://lore.kernel.org/r/20240709160615.998336-12-ojeda@kernel.org [1]
Link: https://lore.kernel.org/r/20240730-target-json-arrays-v1-1-2b376fd0ecf4@google.com [2]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Fix for FineIBT.
- Add more info to commit messages and config descrptions.
- Link to v1: https://lore.kernel.org/r/20240730-kcfi-v1-0-bbb948752a30@google.com

---
Alice Ryhl (1):
      cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS

Matthew Maurer (1):
      rust: cfi: add support for CFI_CLANG with Rust

 Makefile                        | 10 ++++++++++
 arch/Kconfig                    | 16 ++++++++++++++++
 arch/x86/Makefile               |  4 ++++
 init/Kconfig                    |  4 +++-
 rust/Makefile                   |  2 +-
 scripts/generate_rust_target.rs |  1 +
 6 files changed, 35 insertions(+), 2 deletions(-)
---
base-commit: 8718bc07faa6ddf4f7335a12e4cdd4ffc796bbd8
change-id: 20240725-kcfi-c592898e2bfb

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


