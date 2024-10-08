Return-Path: <linux-kbuild+bounces-3977-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8039995790
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 21:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F11E11C248CA
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 19:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5D0212EE2;
	Tue,  8 Oct 2024 19:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xUodQcrV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A981E0DCC
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 19:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728415547; cv=none; b=PTUi5muWN8zNLeHnsA7/j8OrpFIB0SlIxgg3BAAIejETJZIwr3vJoNNpm2TsD5FhUrNaG0S59oXA7kMMXCq9fl/lSg5bYG0ClTW6g66SgwzyHM9FcdXjsV2BlyWzfkJGop/uAmlcW6zvlRKspzFFfC7OROHo6qkw+v4PGSlwVxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728415547; c=relaxed/simple;
	bh=TWsgPNZz/2JdjXauJKY5T1sUyX85dnx5WfvF5vTfPFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YS+fQMm5eqGTXTZpEgIAMeWcGSlVdhhsGG2xWPPHkjciAtXfbLbkDAs3hRfYlS7f9aiwHqzhQ37eCOTe6hC40mgixPdFz4ke4RaOuQpbx5VEAQNhDz0YQPnoKuQDs8MqQeR8HkEnoN0EIsIN7nrDMj+9+OpK8U8cQHwtfsYjH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xUodQcrV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d30e6bde6so801627f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 12:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728415544; x=1729020344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWsgPNZz/2JdjXauJKY5T1sUyX85dnx5WfvF5vTfPFo=;
        b=xUodQcrVteYMYlesKlH6l69d6PQnYELwNnD/tcij8bX2K2bajnwfgP14zM5atlYzy8
         sdUR9tm4sQj3K/0JM4DBHSa+NcLtY5+yvFVPkjCpCIDW4b5diUR7BF+kyliYpkLdLesK
         f23q0MbMupuSN3fiK6nF1l8BSijTHXJlKGOUKbadEOvvtW6oMZS3D+z2yLBs/hvi1ZqC
         yJxtbCVq8lWBu/PzZ0ntt5bDBZlGHB7nXiprrkxELv+rThLREmyGrUTEEldIoCMFPxDb
         1tUnG8RdHMV9hPBnpbkWYA6L++Bv4MLijbyJRQ2mgqMeSDS8fT5NAQn/TgAbzKb0PvnD
         MDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728415544; x=1729020344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWsgPNZz/2JdjXauJKY5T1sUyX85dnx5WfvF5vTfPFo=;
        b=QeJSersimPZHVg0BlI5Ue2jG8Tne0vmlnO4ZtrzYMjRJPdqQJWmOSYy7wO/C2hSIhc
         iTju9Wo8ilAIwYK7dKnUUMltGafXg4qYuLqxjkpiB6280aF62omZwGrzPX39ssKYnPVH
         2A0SXjNZAAtSsfL6O1QZTGDl+kyUNSFZ4b7e1Mc3dBVZKJ6SHhIw20zDS419Yw2EjTil
         l2vMbZUcKBS8UnCTuGe32TV9aBLrLMTGKvn/wvUhv5OiVU4XmBABgeTlNQGS5LkErJWs
         nQixeOZgSstpGKGmqv+QA/UPjbCZvPhwyAJB5fKbr7NOliRh4rUnT9ez+uth4tFSiOHY
         0S8A==
X-Forwarded-Encrypted: i=1; AJvYcCVt4B7GWF3KbIwARlbqFnnT85fLoqqXyFx8mlcKIYeltFfl9WfHbIhNg9hDkjTnwnVIAAlg4kKfGiRM1zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF+cajstNllmmyjmw5CDMBqVkUyD0SOd4DPBbRxH1h6frDdHNO
	WCONV3dPnQTkHhz8IR0oRcGJmyufxTHOsPcjL6YDZjY3BqpKZUDbo/kZ/pV0fO7r9jgCoUl1nb/
	eZKb3R5NHVpKXscllY7qmP0vtyacC/PSUrW1x
X-Google-Smtp-Source: AGHT+IEwybO/xsxE1SIf8NBGGP6HKMIzK7tmXxSPDlmdKKHdmQ9uBtARU8veXUfS/UyxsCMdwoKATeHBATUuncObdow=
X-Received: by 2002:adf:f485:0:b0:374:c92e:f69f with SMTP id
 ffacd0b85a97d-37d0e6f0578mr10249905f8f.16.1728415543868; Tue, 08 Oct 2024
 12:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAGSQo02oVWxazut2nyh-9K9gK+937zKCfYMBkT4EQE2CddvZtg@mail.gmail.com> <CAGSQo01FErmGbeu-+_kRfpQrO4xkaGuSo_zAXTmGHZuFVYXpNw@mail.gmail.com>
In-Reply-To: <CAGSQo01FErmGbeu-+_kRfpQrO4xkaGuSo_zAXTmGHZuFVYXpNw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Oct 2024 21:25:31 +0200
Message-ID: <CAH5fLgi_NhQ5L3MTnB9j=CrFSU8ko3fX2LWe4BcxNr0D1iGWoQ@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Matthew Maurer <mmaurer@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 8:25=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> Err, slight amendment - I think you want `-o $$TMP`, and not
> `--out-dir $$TMPOUT`
>
> You definitely don't want `--out-dir $$TMP`, but the other two
> settings above would be defensible.

Ah good point. It seems like the reason that `--out-dir $$TMP` still
works is that it creates a sub-directory. But I agree that this is not
what we want.

Alice

