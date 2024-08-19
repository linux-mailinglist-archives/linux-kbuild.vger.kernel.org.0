Return-Path: <linux-kbuild+bounces-3098-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF59957494
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 21:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 428071F21A42
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 19:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF33D1DC478;
	Mon, 19 Aug 2024 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jqy44aHK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B2B1DB45F
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2024 19:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724096337; cv=none; b=LCE0zXwCM401mPw3xWrPP5olKYLLLoHw4uKJhc2/7+I0haMp6qoyxsH1sNpsxl6l/HHmwxq4oWJr3K1ZqPBtbmAbggewvFgiFhuiufIWxl4axzfzBq7e0GZA4Q/FXvmr4QMaKTFB0jY2AKSs/MirX4G26iR80dmoGUnvBFs261c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724096337; c=relaxed/simple;
	bh=F7wkcHJPXIPuDfH/klr4thKavbEnJmwxdbEiZYRhu1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKJqq1MmwYfwIn7L9Q7w28yXKfEtpjxWE3CLNCeEA8wRYJGZ+iDBYSpiWHwJpqIOy/n4LNv+LhztCh9wY6meyON3doZj+iLxNJEQy9s6XSms5ZDdqz3Q2mlwZFpZ/h7lfO0DoqUJzA9P12sb8BZvZoRcQNKTUUpB6IR2nE30Heo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jqy44aHK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-201fae21398so26461915ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2024 12:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724096335; x=1724701135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YeS++fCKemkXhDJMjat3ElWefP5AW5Wy1oKzA28CFNw=;
        b=Jqy44aHKfCucjW6dSdgDbzaqx2bnXrzPEbfetshLmrEaw/8xyi0TxC5h7b8LHg8N/t
         kouRMUJCIINWGrPLvd4Sca5u2B86Qpu1OApbkfFi9jPE4QPO7YgUqf48/pp/avbE7M1F
         lXJKrVlyu8na4SVtkpsonw//DihGztrsDcWO8orF6NQltKwhUgETN4S6mzahBatvl4yK
         UMKc7DJodi8BjCyDHN1sSBeQM4hD1rgsoVbAMCZPZst7QDHwCBS9MNExih6UbG4Uzp3E
         K7W7VpffRMkE0tER85oamhTkLH2AFLpW0FSWfqnMxWZ7uyCW3dVhQkwozOJ+vYV/wb0k
         fn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724096335; x=1724701135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeS++fCKemkXhDJMjat3ElWefP5AW5Wy1oKzA28CFNw=;
        b=gnUSAS8lCFN/L181/hwJKUwVUvu95lqRcIcSkpOFELhwqh6ORhmK63qZOptvfj35yp
         CPcOkt3MtuEyCjAWp9IaFCUHuybFbE4rvyp1nt4oDGUmhTNKNbNc1EJPenvwCh+jDOfP
         Stw2txZAzrlQ0vxPpiQPf+Ove7jvIfOPZk2aqDVLboAB6qQE+Z7Mb7PbZuOxSzHIqucJ
         Tdjq82Jxb4d9xtj/w2SjMNJmQFm5bH5UjUwmqmn2SYpAaOCFN4D24lJchPI+deqc7RWS
         sk4CUoPs3/I3uD8TQibG3ZxQvPfRYf1PqdRP/PF8eoby84BojvJpjzza/YjOribLxLcD
         8mDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzP0LVEkjhaniELToHXfJ/qYmYEJGp3dLrbZcHqnoQ+uHXw0EgPICzFprn6KnMAY8ovzpVlYReo9IZmU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz69GNSFJJ6vWZuPcsMQwKr4R68XxVopEA9NmBzYJ0t/vPALvx4
	PLKTxwiBUxHaxY1/VezKOKDnkIgSVZ3SB/RartTS0nJJ4WrO6pQEklhsQWm5oQ==
X-Google-Smtp-Source: AGHT+IG8oRBHqBpvRvU+j9ijDv76wPfUzxrx1g+I09GD1WWcWllKaTLicpQtA41S0/MWaq3kkTtGZA==
X-Received: by 2002:a17:903:188:b0:202:4d05:a24a with SMTP id d9443c01a7336-2024d05a587mr34136775ad.16.1724096334977;
        Mon, 19 Aug 2024 12:38:54 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03197b6sm65427305ad.69.2024.08.19.12.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:38:54 -0700 (PDT)
Date: Mon, 19 Aug 2024 19:38:51 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
Message-ID: <20240819193851.GA4809@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com>
 <2024081600-grub-deskwork-4bae@gregkh>
 <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com>
 <2024081705-overarch-deceptive-6689@gregkh>
 <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>

Hi Benno,

On Sat, Aug 17, 2024 at 01:19:55PM +0000, Benno Lossin wrote:
> 
> For this use-case (the one in the patch), I don't really know if we want
> to copy the approach from C. Do we even support exporting kABI from
> Rust? If yes, then we I would recommend we tag it in the source code
> instead of using a union. Here the example from the patch adapted:
> 
>     #[repr(C)] // needed for layout stability
>     pub struct Struct1 {
>         a: u64,
>         #[kabi_reserved(u64)] // this marker is new
>         _reserved: u64,
>     }
> 
> And then to use the reserved field, you would do this:
>     
>     #[repr(C)]
>     pub struct Struct1 {
>         a: u64,
>         #[kabi_reserved(u64)]
>         b: Struct2,
>     }
> 
>     #[repr(C)]
>     pub struct Struct2 {
>         b: i32,
>         v: i32,
>     }
> 
> The attribute would check that the size of the two types match and
> gendwarfksyms would use the type given in "()" instead of the actual
> type.

This definitely looks cleaner than unions in Rust, but how would this
scheme be visible in DWARF? You might also need to expand the annotation
to allow replacing one reserved field with multiple smaller ones without
using structs.

Sami

