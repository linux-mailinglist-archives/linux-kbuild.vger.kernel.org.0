Return-Path: <linux-kbuild+bounces-8999-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D39BABB9362
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Oct 2025 03:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C0C84E14D6
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Oct 2025 01:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF3F16A395;
	Sun,  5 Oct 2025 01:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da99MFy+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9004515ADB4
	for <linux-kbuild@vger.kernel.org>; Sun,  5 Oct 2025 01:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759626668; cv=none; b=NycrHelUOi+HziVg6drJIIcG50myNIog9Bx5Wq32/hYbVGjMyECZZ7cs0XRhEuIYQdCBhh6BL83VzMfQrNEkHltMsLK7LR8FzwyUSK9AjoZ5ifKqmCWZXWDvgDG6h/QrU+btag3DVNkSbLZv1o+C5gmFUF4F9FK9jCZ0lW8oF2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759626668; c=relaxed/simple;
	bh=CaGXHLH/DXwBBr2/jmC0yukKlVcNAe2XnJ4WlAHZj3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qzcueh4QmMGOZycTqywEsKPA/Rwn6l1lDS3NEc+FONgkYUpPzbeFe5rkDmjl2Ec0joKzSGM7kkRjWkNXLCA6F761anHWVhBdU1j48uYrz6NFCmP1wYcyDYwlJ/cJ3KSDeqddr93Y3nA/57j60VVHdHEnBTcrK0HHIkdlyn2afdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da99MFy+; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso7397603a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Oct 2025 18:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759626665; x=1760231465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJyOkytP/4T7QJZkkLYSODGgdQWKJzRCxXSDdPVWq/8=;
        b=da99MFy+PbMSdweXwWhsDwhN0i59mJA3Cbwr9mx3CuQ15/Z5Nqs8RX1mrD8qLokC45
         8bkHC+rUXg8C6MPXo+yjf22tY6o6z7dZD1FH8Mut61rBl/eW9xgWXzHfFINtI3dAXrIt
         TJa3WBgyQvP1WaEdu9gCG4EDbuhwNEroBFJqChCA7Dv0wHR6bpkYxYmXjnHDohoKGEMr
         ACNwHwrOiv6a2hNyZN2AJi56l9NIZak/7Lim+XX+c52icwaflqlmRJCOj1lA8LZWetSo
         8FlSQlL0iaZ/0YZzZ5/clE0aEZoGRskAVqZ3U+H05ZxbuhkQ+I9PYwL9tijdn5yINm3t
         QRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759626665; x=1760231465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJyOkytP/4T7QJZkkLYSODGgdQWKJzRCxXSDdPVWq/8=;
        b=iWEedFL81ghkEWeNO51aRrMyTZ2vnjQXerfmqZJQwWDX/MI8om/o9ygQYp2A1LGGJ3
         R6EWadq2NuxXqtOGeHBS0w1W454NN/8bCt7a5jPv2VCW1xmKHPcBXhTGe5RxqlZkrcSc
         nq2yquc8M/ge86YN3g41LsOvJVoE34B/TO32/bLCLEoMyAnfb5kT3lMabLtjchYxACXL
         JCjrxOVgA5PXZA+263OVXyWnHX1w4apCGTK3IPw4HItpK7EYiAb7kAsR71zENksVCI/B
         dpOsGgr7/QmYh7mezj5nhtcP4b8ulxn/ctMvMeXhqKchp4Sa3Q716YAeN6eBfkX+mOsB
         bbuw==
X-Forwarded-Encrypted: i=1; AJvYcCXjX5nbm2CcFSRNeoanaTV93giYZHaMvywKoy5Ezhrbb9Rqa/DhLzCTF9ahaQvVFnFyXBlVAW8J7xxvD4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1FmKklDXI08Ce3maahtgc9J9gy1M5oIcoTmTjLNP55fvnUjew
	t71KuDl0r95GMTu0EFg98YygefFGj/Rm+bT4IUiodf1v8jrFzuVvP+jq
X-Gm-Gg: ASbGncu680fxgP552wIqk9NeshWvUbdodgKCCXLJIXZpTtcuHnW9jN+8hcvGN4koIru
	H6O6/JGhGlswNREgYdXB0e53ow7QNkpZg6Mq0BPsMUQ8SWKYWJbiaADRmRODtzS67H827IU29y+
	Lmmpadn9j8ZIYcgO73bvE/HMdncdsc8SQ73X3FfINDO7yjGK540wZgehAowZ/He8z20bnqOAwxj
	sjIbhAU/OXZzBxzoZnXtOfGWbppZcu6LIclNppbCSaKsLxuFnj4mQa3qcoJpdu5j966AhywkQ8e
	0Wk3FT+EOG+di1OwVfCQyCMCP3xMnxo6PGKVHupM6nnvVwdbbZjiqkO9EnYw1xyImxlI6tzx1qF
	Lji4qzvD0RJQeLLZO72R8XD6ApYaXoc1GjkuQth+BB+soYE8w34iwfsZHZtHfrYJd
X-Google-Smtp-Source: AGHT+IG2JHkZbVmxw0BSVWQUDtAW3CvyW6jcfDbCRqfhUgKCZ1TjqKPOpf4r+o/oGRMoBnsYj084Gg==
X-Received: by 2002:a17:907:3c8e:b0:b31:ec30:c678 with SMTP id a640c23a62f3a-b49c525ee7dmr904311866b.57.1759626664728;
        Sat, 04 Oct 2025 18:11:04 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b48652a9bf1sm802257166b.13.2025.10.04.18.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Oct 2025 18:11:04 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: thomas.weissschuh@linutronix.de
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
Date: Sun,  5 Oct 2025 04:10:47 +0300
Message-ID: <20251005011100.1035272-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
References: <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"Thomas Weißschuh" <thomas.weissschuh@linutronix.de>:
> Enable -Werror unconditionally

Please, drop this patch.

Never enable -Werror unconditionally for any part of build.

I often bisect Linux. And to do this, I often need to build very old
Linux commits (with modern compiler). Unconditional -Werror will make
this impossible.

For example, recently I found this regression:

https://lore.kernel.org/regressions/197f290e30b.eaadc7bc7913.7315623184036672946@zohomail.com/T/#u

The regression caused by commits happened in 2019.

So to bisect it, I had to build 2019 trees using modern compiler.

-- 
Askar Safin

