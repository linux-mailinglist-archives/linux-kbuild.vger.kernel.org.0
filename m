Return-Path: <linux-kbuild+bounces-8996-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EED95BB88F9
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Oct 2025 05:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADBB719C15FE
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Oct 2025 03:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E469211491;
	Sat,  4 Oct 2025 03:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijbnwCKS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5401494C2
	for <linux-kbuild@vger.kernel.org>; Sat,  4 Oct 2025 03:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759549168; cv=none; b=sklAqq2ZItD1WEtzMp/PUwOpJSsupScoCx13+mA15fVKtevtnoPElIRz9tZ1ZIS5XojEzrbin1PIdNFfFctiUhL6sgnCkau1Qg0oLSnYmaz1ioY5XOEtNWRsQ7L2S6S23wELctycvTp2O6G9GK3TdVtuq8LjyE/whBSJRiuhvn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759549168; c=relaxed/simple;
	bh=adLGxos5qmqRuJMEHd5iRNMuue96SjLLdXgZKG7WDNU=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GkzpgPzMv9TfqLM5ZTbvUakaG8Ag5+Uo2M9FTCIgjCTFBjV8Ou0hYmsjWoK8mbxZTugW5SenlECVAaCR74Xj2RnF90Ixs0Ib/V9yZ1lVEFg7xmsJEljSThQJxUtgl6jtsTzBL2z4aAUr6UbHhtzXuxoBcgpXodyl18uqkfPXaXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijbnwCKS; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6353e91a04aso3497212d50.2
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Oct 2025 20:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759549166; x=1760153966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XJ9GrKZlJAkRDs8pcuNoL9OYf934YYPQgeZ31YeNojQ=;
        b=ijbnwCKSjmh93f+3B5NjXA3YApQGjbSMrCTTBqcz9lgUIYoEhPIKC+tDbqfCu0Bcgv
         riw6d4l6DN1nJ0ioFPUwHC+RuETdYdy5pKtdTG9EK97iQyLUNt3emX2MUDRG+yLjtvlx
         LS8LSqwzUpr6k8kP2rklHSjsLgGfNtCwrewYgPM4yCkTzQ5eCW7ho8X/Mxi96oqa1o5G
         17GgA+5KQsD15RhvpuUA2HOskmqpnLmGOry/2cD79SP+1p1xKiaNqA7Ki0YnCk5fCBbq
         XbaQ8JY2i657fAYW/piUKWa6crRk6yE13C0t/Om2ROBxE5lltoWUCiFxe3gsHdc9IJ4J
         nEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759549166; x=1760153966;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ9GrKZlJAkRDs8pcuNoL9OYf934YYPQgeZ31YeNojQ=;
        b=UhadLvPNQwUO2CPIKrQSOI0b6ZeuKCXqNKneetGDddKYxoqOm3x/jGfJ6nmBKG88Jo
         1JMuQhnKclBYzDpbFz0Am6Q7/BQfyjmsQ1DZs3h5e9Hc0gYySsho6cC8mJdxYYplOEdY
         VCvrSosr7+5dfg31OjfHrNnI/FnHcqsBtwZtP+ioekzsCvp1iMqW6LkukM9op/RDmPfq
         wLDgc1dE/tpRRn8N3tqJ8EqXp5P2CqsvGkg9oY7Ia9bytj27s342eujN1WBbc5gEMhJR
         9/NOKP8o3DNSRFhIkKuDrJLd8iUxC0UwtQFHVsAKexpElbIYESBy4gODuhEGB8qaFj/O
         Fupw==
X-Forwarded-Encrypted: i=1; AJvYcCWFR0IQc15G0MbqhrF20iTJKiowf+JmH6Wgl6mHbbEavAmvXFaSYwEGiNnrO6028xx5+sHQSVJfngK7n3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxeDAoz7j6mH/PsNLrBlqYS4oXVOEtcZr3vWZTE0uN1lzE5WSH
	rutGiN7hQXhU8rFBkOvOfd/oxF7uoiJBcixSaHNH+Mz/fJXeZBsNbQvP
X-Gm-Gg: ASbGnctKKXHi+KxVq0nb6LBrhwnDjnbOn03wwLu7eF+4GRRfjM6Uqu2WjrQCgdoglnr
	0ClfFLtTRBrU0NqjaewOLS0JQ1wIJJe5p9G64GarUp6qiSLfIIxuOzM2VDOtqUpsIKgmQqz4YZm
	XwtJNoGmOXpirgC3QsF/+GQes5790ZHCW2A4H9yp5jMNYxrBaFzYuBlUtzIJ5x0WEzK0shM9cGy
	bOX+SfR0UnkkDfPG41nqbIcxBX+TPQ5eBnILllHIx+zsKbD8WIufsJYLx5ayiNCseoOPCYH50pM
	Ia+ticLv3sC5qKiA7HS4O/ctOo+2M1QCyyMHKsy/z77jzBbizbJbelQK6SaSLeKJhZvSasgl8o2
	Rdq4J68eFmjTX3X8gvaTwSh4AnHnKCj0pK7LQVJb7PfIyfnXd/RI0uLnIxbKem2E0/j+4CymFoT
	nB
X-Google-Smtp-Source: AGHT+IEKZvWN4IhopDHTsskInMYzN0OVIkAxgqusRW8r17U6C+PiDNXpSR1wTVqdnpL2FZWd78muIg==
X-Received: by 2002:a05:690c:4c0e:b0:749:d874:e66e with SMTP id 00721157ae682-77f945ef5c3mr72382767b3.24.1759549165127;
        Fri, 03 Oct 2025 20:39:25 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63b846c9bcdsm2324131d50.31.2025.10.03.20.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 20:39:24 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <b5efc638-ab7c-4639-ae7c-c0f8f8b4e765@gmail.com>
Date: Sat, 4 Oct 2025 11:39:17 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
To: Vivian Wang <wangruikang@iscas.ac.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>,
 Conor Dooley <conor@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
 <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/25 1:20 PM, Vivian Wang wrote:
> I think instead of testing libclang version, it would make more sense to
> feature test if bindgen the binary supports these flags, like what we
> already do with $(cc-option,...).
>
> Same for all the other version tests.

This is another direction worth trying, but unfortunately I probably 
won't have time to refactor this patch towards that direction until the 
end of the month. Sorry for that.

