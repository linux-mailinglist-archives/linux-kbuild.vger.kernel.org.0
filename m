Return-Path: <linux-kbuild+bounces-6370-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8DA7644C
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 Mar 2025 12:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2C51888387
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 Mar 2025 10:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6821E0DD1;
	Mon, 31 Mar 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAP1+gMQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB21B423C;
	Mon, 31 Mar 2025 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417232; cv=none; b=OZVcSND4W4l0nExqp69UptVhJfvkpq9cheY/LcudslyGl+mIPlbxdLUAjwS5qOGN+hGBdlVDanKLwlkY81cJ6NYGJlXvmxu4fMKdZanj8i4HnKed4qRk78BpalzMB/47MqcnMgWI93LZD898J+Kp965UE1UXuY7BPFMWnBCp0TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417232; c=relaxed/simple;
	bh=V+nvJHEKSc7RVyDkt/rWuaHqycBDDiUWYXIVgWOh9/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJKzDljmpg7OgGN7d510KtfRlvTLrTptXVxWiopIZPoxaD2M/J/oeaPDycVd6JZPwXwePrFEsl9DyLDt/uM7LHdalwA4y5CNZKHIwvfzDdMz8t05/SdxqeFYUGYKlJrnfanqvrz+OMWEUJIas9KiXkMW+PH6V8ZTfnJMhC8+6jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAP1+gMQ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so911299a91.0;
        Mon, 31 Mar 2025 03:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743417230; x=1744022030; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ymg/Cdc7QMPeQSgZgpVdKX0gHjsRWWGovJfMrOlttUw=;
        b=iAP1+gMQ5G8AhcGhcpjzEPU7yUMUvlPT+L3EkTS1TAr78zA6BmJXA2F4N03G5OK5iM
         tHWGMeSOAd6Vv0wQnTuMpWETv95TFHjQDFxGKoz22ErpPxy2HGacnpCOaClEm68xWx+P
         mAoYPXGC6nI+xoeW4TcHHV1kdP+qf02ZP2fhIFRtmyXX7qj+rixu4nBh2Hh+yqJjZMJ2
         2gxOPW5AeXN7LtSthvrkffBJUKf2QRCwKCQCvKC130PD1/PhEIdglGSQu7PBvS5YFZWo
         oAgUYV8QNS2i7MD5+pujV1yy48Z8Ke8WUCLxPpMSdkG91jnuNDpJ9WmCZ44BZyjVQcdl
         /LwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417230; x=1744022030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymg/Cdc7QMPeQSgZgpVdKX0gHjsRWWGovJfMrOlttUw=;
        b=JXWvPAMe3PL3ceM17JFAow6Wv0D+j5NPuGeC66Ui0mmZP+SL3pKRM1ZzDOeTrpEXVc
         ows3ZLvSvrfY633pWaEqXOxuCyn2bf5ao2VVwNZIS0CUg5fWAT2hHKMPsygEzs3GIs9S
         MjFsXGSRMm5t/f7cG+XFdFfb/axAeWxc1aBaZQxNGFbQXF+5ofm9gW2bDyyek97pQOHQ
         MrdI5XG/HmqJ03qIWZ4IzjEY023fY7a9OiSDUmHKA5p2akP3GtQnyWBd/+Xeg6PJykpH
         1O+2yX9UWfgf6gDjxnlsBNzl4he9u5A4+ydwC/Sdg9QrBnHb7H2C3+044Qhubkt7DGhy
         vEww==
X-Forwarded-Encrypted: i=1; AJvYcCU0jaBVPphGQ92u25NYParcBtaHM5l/0o/+1g9NoF+KICoH3REXrEbGaA4GuP85SPsXEBNEzRhFbdDAOvHF@vger.kernel.org, AJvYcCVLFtUTHYbGnGynBn8MVvfsPnLYOmo4EnGG9XjJPJaI0bBkKjuLrY3X/6jVGVq49DkJgoAwo2WtczuJVUE=@vger.kernel.org, AJvYcCVW15h2G03tFvtVoyWymecso6oIprb0x80sT5vlM1PCw9pbI5vfX6QXkQNB0ouBtwgSBXifJcAmTuF5BQSS4g==@vger.kernel.org, AJvYcCXxpBBarqZhc/x3JkVaY0iFbtYUjps1+UL9LiqULlFCCUyFl/CKlnXiTdUUVgHBD8MzsKZmzXcoQMgtvTlllZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBlwd1i1TFX71ooP5m+oJJrhf0EWQyftzyf8TQBvDjIc3NBWBQ
	RAy0iw6zIk/f69EUqnFMlEaxXfVCNmXATyYHzQ0r2mlBsCXpfEYgjfkDbgEdaHc/ueKnYSUcK9l
	bSeZohIHBSp8Our2N6gVuTnhtR0I=
X-Gm-Gg: ASbGncsmkUloRsasf0rH8B4FfTDhRJ3BcdBy25YMjKg29RyGf3FfsThDJUDlGR5BGx+
	i4F1hLETaL6TMfI7s7CahQKfcoTQJN8bgtwc+PvMl5phoXw3vLkR1C0qq6u5nFiyeLw83zrxJjX
	QaWdViPIjM1AYqCeOy3yql9fYjRQ==
X-Google-Smtp-Source: AGHT+IG1yvyZqQKBWgCd3SOpveKkgZdUKWVgbzbrCVkuqPBmcDYK+FCWjv+bFl07sW/u5TQeP4FhQ0382rqxZVtC0ng=
X-Received: by 2002:a17:90b:224e:b0:2fe:7f51:d2ec with SMTP id
 98e67ed59e1d1-30531e89641mr4687661a91.0.1743417230239; Mon, 31 Mar 2025
 03:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321-module-params-v3-v9-0-28b905f2e345@kernel.org> <20250321-module-params-v3-v9-1-28b905f2e345@kernel.org>
In-Reply-To: <20250321-module-params-v3-v9-1-28b905f2e345@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 12:33:37 +0200
X-Gm-Features: AQ5f1Jr7JBoFjUI1hhmX2VMHXtyRsO5wHz0E3PuoYks4mfWi7JFnTrFKfia5rWc
Message-ID: <CANiq72kSG8oGi9P4=AQ+JjgZk0q31PcZkHRYNF5tCxn9mvcJ0A@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] rust: str: add radix prefixed integer parsing functions
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Luis Chamberlain <mcgrof@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000b4446b0631a0f4ea"

--000000000000b4446b0631a0f4ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 10:18=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Add the trait `ParseInt` for parsing string representations of integers
> where the string representations are optionally prefixed by a radix
> specifier. Implement the trait for the primitive integer types.
>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I had applied the following comments in v8 when I originally took it
before discovering the UB -- since this patch may finally go through
modules (or not), Andreas asked me to put them here:

    [ Added integer type suffixes to `assert!`s for consistency with the
      others. Changed links to docs.kernel.org. Applied Markdown and
      intra-doc links where possible. Changed to `///` for `mod` docs.
      Slightly reworded comment. Pluralized section name. Hid
      `use`s. Removed `#[expect]` for the `rusttest` target. - Miguel ]

Attached range diff of what I did.

I hope that helps!

Cheers,
Miguel

--000000000000b4446b0631a0f4ea
Content-Type: text/x-patch; charset="US-ASCII"; name="rd.diff"
Content-Disposition: attachment; filename="rd.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m8wxk5nf0>
X-Attachment-Id: f_m8wxk5nf0

K0BAIHJ1c3Qva2VybmVsL3N0ci5yczogbWFjcm9fcnVsZXMhIGNfc3RyIHsKKyB9CisKKyAjW2Nm
Zyh0ZXN0KV0KKy0jW2V4cGVjdChjbGlwcHk6Oml0ZW1zX2FmdGVyX3Rlc3RfbW9kdWxlKV0KKyBt
b2QgdGVzdHMgeworICAgICB1c2Ugc3VwZXI6Oio7CisKIEBAIHJ1c3Qva2VybmVsL3N0ci5yczog
Zm4gZm10KCZzZWxmLCBmOiAmbXV0IGZtdDo6Rm9ybWF0dGVyPCdfPikgLT4gZm10OjpSZXN1bHQg
ewogIG1hY3JvX3J1bGVzISBmbXQgewogICAgICAoJCgkZjp0dCkqKSA9PiAoIGNvcmU6OmZvcm1h
dF9hcmdzISgkKCRmKSopICkKICB9CiArCisrLy8vIEludGVnZXIgcGFyc2luZyBmdW5jdGlvbnMg
Zm9yIHBhcnNpbmcgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2VycworKy8vLyBwb3RlbnRpYWxs
eSBwcmVmaXhlZCB3aXRoIGAweGAsIGAwb2AsIG9yIGAwYmAuCiArcHViIG1vZCBwYXJzZV9pbnQg
ewotKyAgICAvLyEgSW50ZWdlciBwYXJzaW5nIGZ1bmN0aW9ucyBmb3IgcGFyc2luZyBzaWduZWQg
YW5kIHVuc2lnbmVkIGludGVnZXJzCi0rICAgIC8vISBwb3RlbnRpYWxseSBwcmVmaXhlZCB3aXRo
IGAweGAsIGAwb2AsIG9yIGAwYmAuCi0rCiArICAgIHVzZSBjcmF0ZTo6cHJlbHVkZTo6KjsKICsg
ICAgdXNlIGNyYXRlOjpzdHI6OkJTdHI7CiArICAgIHVzZSBjb3JlOjpvcHM6OkRlcmVmOwpAQCBy
dXN0L2tlcm5lbC9zdHIucnM6IGZuIGZtdCgmc2VsZiwgZjogJm11dCBmbXQ6OkZvcm1hdHRlcjwn
Xz4pIC0+IGZtdDo6UmVzdWx0IHsKICsgICAgICAgIC8vIFRoaXMgaXMgcmVxdWlyZWQgYmVjYXVz
ZSB0aGUgYGZyb21fc3RyX3JhZGl4YCBmdW5jdGlvbiBvbiB0aGUgcHJpbWl0aXZlCiArICAgICAg
ICAvLyBpbnRlZ2VyIHR5cGVzIGlzIG5vdCBwYXJ0IG9mIGFueSB0cmFpdC4KICsgICAgICAgIHB1
YiB0cmFpdCBGcm9tU3RyUmFkaXg6IFNpemVkIHsKLSsgICAgICAgICAgICAvLy8gUGFyc2UgYHNy
Y2AgdG8gYFNlbGZgIHVzaW5nIHJhZGl4IGByYWRpeGAuCisrICAgICAgICAgICAgLy8vIFBhcnNl
IGBzcmNgIHRvIFtgU2VsZmBdIHVzaW5nIHJhZGl4IGByYWRpeGAuCiArICAgICAgICAgICAgZm4g
ZnJvbV9zdHJfcmFkaXgoc3JjOiAmQlN0ciwgcmFkaXg6IHUzMikgLT4gUmVzdWx0PFNlbGYsIGNy
YXRlOjplcnJvcjo6RXJyb3I+OwogKwotKyAgICAgICAgICAgIC8vLyBSZXR1cm4gdGhlIGFic29s
dXRlIHZhbHVlIG9mIFNlbGY6Ok1JTi4KKysgICAgICAgICAgICAvLy8gUmV0dXJuIHRoZSBhYnNv
bHV0ZSB2YWx1ZSBvZiBbYFNlbGY6Ok1JTmBdLgogKyAgICAgICAgICAgIGZuIGFic19taW4oKSAt
PiB1NjQ7CiArCiArICAgICAgICAgICAgLy8vIFBlcmZvcm0gYml0d2lzZSAyJ3MgY29tcGxlbWVu
dCBvbiBgc2VsZmAuCkBAIHJ1c3Qva2VybmVsL3N0ci5yczogZm4gZm10KCZzZWxmLCBmOiAmbXV0
IGZtdDo6Rm9ybWF0dGVyPCdfPikgLT4gZm10OjpSZXN1bHQgewogKyAgICAgICAgICAgIFtiJzAn
LCBiJ28nIHwgYidPJywgcmVzdCBAIC4uXSA9PiAoOCwgcmVzdC5hc19yZWYoKSksCiArICAgICAg
ICAgICAgW2InMCcsIGInYicgfCBiJ0InLCByZXN0IEAgLi5dID0+ICgyLCByZXN0LmFzX3JlZigp
KSwKICsgICAgICAgICAgICAvLyBOT1RFOiBXZSBhcmUgaW5jbHVkaW5nIHRoZSBsZWFkaW5nIHpl
cm8gdG8gYmUgYWJsZSB0byBwYXJzZQotKyAgICAgICAgICAgIC8vIGxpdGVyYWwgMCBoZXJlLiBJ
ZiB3ZSByZW1vdmVkIGl0IGFzIGEgcmFkaXggcHJlZml4LCB3ZSB3b3VsZCBub3QKKysgICAgICAg
ICAgICAvLyBsaXRlcmFsIGAwYCBoZXJlLiBJZiB3ZSByZW1vdmVkIGl0IGFzIGEgcmFkaXggcHJl
Zml4LCB3ZSB3b3VsZCBub3QKICsgICAgICAgICAgICAvLyBiZSBhYmxlIHRvIHBhcnNlIGAwYC4K
ICsgICAgICAgICAgICBbYicwJywgLi5dID0+ICg4LCBzcmMpLAogKyAgICAgICAgICAgIF8gPT4g
KDEwLCBzcmMpLApAQCBydXN0L2tlcm5lbC9zdHIucnM6IGZuIGZtdCgmc2VsZiwgZjogJm11dCBm
bXQ6OkZvcm1hdHRlcjwnXz4pIC0+IGZtdDo6UmVzdWx0IHsKICsgICAgLy8vIHBlcm1pdHRlZC4g
QW55IHN0cmluZyBwYXJzZWQgYnkgW2Brc3RydG9sKClgXSBvciBbYGtzdHJ0b3VsKClgXSB3aWxs
IGJlCiArICAgIC8vLyBzdWNjZXNzZnVsbHkgcGFyc2VkLgogKyAgICAvLy8KLSsgICAgLy8vIFtg
a3N0cnRvbCgpYF06IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2NvcmUt
YXBpL2tlcm5lbC1hcGkuaHRtbCNjLmtzdHJ0b2wKLSsgICAgLy8vIFtga3N0cnRvdWwoKWBdOiBo
dHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9jb3JlLWFwaS9rZXJuZWwtYXBp
Lmh0bWwjYy5rc3RydG91bAorKyAgICAvLy8gW2Brc3RydG9sKClgXTogaHR0cHM6Ly9kb2NzLmtl
cm5lbC5vcmcvY29yZS1hcGkva2VybmVsLWFwaS5odG1sI2Mua3N0cnRvbAorKyAgICAvLy8gW2Br
c3RydG91bCgpYF06IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2NvcmUtYXBpL2tlcm5lbC1hcGku
aHRtbCNjLmtzdHJ0b3VsCiArICAgIC8vLwotKyAgICAvLy8gIyBFeGFtcGxlCi0rICAgIC8vLyBg
YGAKLSsgICAgLy8vIHVzZSBrZXJuZWw6OnN0cjo6cGFyc2VfaW50OjpQYXJzZUludDsKLSsgICAg
Ly8vIHVzZSBrZXJuZWw6OmJfc3RyOworKyAgICAvLy8gIyBFeGFtcGxlcwogKyAgICAvLy8KLSsg
ICAgLy8vIGFzc2VydF9lcSEoT2soMCksIHU4Ojpmcm9tX3N0cihiX3N0ciEoIjAiKSkpOworKyAg
ICAvLy8gYGBgCisrICAgIC8vLyAjIHVzZSBrZXJuZWw6OnN0cjo6cGFyc2VfaW50OjpQYXJzZUlu
dDsKKysgICAgLy8vICMgdXNlIGtlcm5lbDo6Yl9zdHI7CisrICAgIC8vLyBhc3NlcnRfZXEhKE9r
KDB1OCksIHU4Ojpmcm9tX3N0cihiX3N0ciEoIjAiKSkpOwogKyAgICAvLy8KICsgICAgLy8vIGFz
c2VydF9lcSEoT2soMHhhMnU4KSwgdTg6OmZyb21fc3RyKGJfc3RyISgiMHhhMiIpKSk7CiArICAg
IC8vLyBhc3NlcnRfZXEhKE9rKC0weGEyaTMyKSwgaTMyOjpmcm9tX3N0cihiX3N0ciEoIi0weGEy
IikpKTsKQEAgcnVzdC9rZXJuZWwvc3RyLnJzOiBmbiBmbXQoJnNlbGYsIGY6ICZtdXQgZm10OjpG
b3JtYXR0ZXI8J18+KSAtPiBmbXQ6OlJlc3VsdCB7CiArICAgIC8vLyBhc3NlcnRfZXEhKE9rKDBi
MTAwMWkxNiksIGkxNjo6ZnJvbV9zdHIoYl9zdHIhKCIwYjEwMDEiKSkpOwogKyAgICAvLy8gYXNz
ZXJ0X2VxIShPaygtMGIxMDAxaTE2KSwgaTE2Ojpmcm9tX3N0cihiX3N0ciEoIi0wYjEwMDEiKSkp
OwogKyAgICAvLy8KLSsgICAgLy8vIGFzc2VydF9lcSEoT2soMTI3KSwgaTg6OmZyb21fc3RyKGJf
c3RyISgiMTI3IikpKTsKKysgICAgLy8vIGFzc2VydF9lcSEoT2soMTI3aTgpLCBpODo6ZnJvbV9z
dHIoYl9zdHIhKCIxMjciKSkpOwogKyAgICAvLy8gYXNzZXJ0IShpODo6ZnJvbV9zdHIoYl9zdHIh
KCIxMjgiKSkuaXNfZXJyKCkpOwotKyAgICAvLy8gYXNzZXJ0X2VxIShPaygtMTI4KSwgaTg6OmZy
b21fc3RyKGJfc3RyISgiLTEyOCIpKSk7CisrICAgIC8vLyBhc3NlcnRfZXEhKE9rKC0xMjhpOCks
IGk4Ojpmcm9tX3N0cihiX3N0ciEoIi0xMjgiKSkpOwogKyAgICAvLy8gYXNzZXJ0IShpODo6ZnJv
bV9zdHIoYl9zdHIhKCItMTI5IikpLmlzX2VycigpKTsKLSsgICAgLy8vIGFzc2VydF9lcSEoT2so
MjU1KSwgdTg6OmZyb21fc3RyKGJfc3RyISgiMjU1IikpKTsKKysgICAgLy8vIGFzc2VydF9lcSEo
T2soMjU1dTgpLCB1ODo6ZnJvbV9zdHIoYl9zdHIhKCIyNTUiKSkpOwogKyAgICAvLy8gYXNzZXJ0
ISh1ODo6ZnJvbV9zdHIoYl9zdHIhKCIyNTYiKSkuaXNfZXJyKCkpOwogKyAgICAvLy8gYGBgCiAr
ICAgIHB1YiB0cmFpdCBQYXJzZUludDogcHJpdmF0ZTo6RnJvbVN0clJhZGl4ICsgVHJ5RnJvbTx1
NjQ+IHsKQEAgcnVzdC9rZXJuZWwvc3RyLnJzOiBmbiBmbXQoJnNlbGYsIGY6ICZtdXQgZm10OjpG
b3JtYXR0ZXI8J18+KSAtPiBmbXQ6OlJlc3VsdCB7CiArICAgICAgICAgICAgICAgICAgICAvLyAy
J3MgY29tcGxlbWVudCB2YWx1ZXMgcmFuZ2UgZnJvbSAtMl4oYi0xKSB0byAyXihiLTEpLTEuCiAr
ICAgICAgICAgICAgICAgICAgICAvLyBTbyBpZiB3ZSB3YW50IHRvIHBhcnNlIG5lZ2F0aXZlIG51
bWJlcnMgYXMgcG9zaXRpdmUgYW5kCiArICAgICAgICAgICAgICAgICAgICAvLyBsYXRlciBtdWx0
aXBseSBieSAtMSwgd2UgaGF2ZSB0byBwYXJzZSBpbnRvIGEgbGFyZ2VyCi0rICAgICAgICAgICAg
ICAgICAgICAvLyBpbnRlZ2VyLiBXZSBjaG9vc2UgdTY0IGFzIHN1ZmZpY2llbnRseSBsYXJnZS4g
Tk9URTogMTI4Ci0rICAgICAgICAgICAgICAgICAgICAvLyBiaXQgaW50ZWdlcnMgYXJlIG5vdCBh
dmFpbGFibGUgb24gYWxsIHBsYXRmb3JtcywgaGVuY2UKLSsgICAgICAgICAgICAgICAgICAgIC8v
IHRoZSBjaG9pY2Ugb2YgNjQgYml0LgorKyAgICAgICAgICAgICAgICAgICAgLy8gaW50ZWdlci4g
V2UgY2hvb3NlIGB1NjRgIGFzIHN1ZmZpY2llbnRseSBsYXJnZS4KKysgICAgICAgICAgICAgICAg
ICAgIC8vCisrICAgICAgICAgICAgICAgICAgICAvLyBOT1RFOiAxMjgtYml0IGludGVnZXJzIGFy
ZSBub3QgYXZhaWxhYmxlIG9uIGFsbAorKyAgICAgICAgICAgICAgICAgICAgLy8gcGxhdGZvcm1z
LCBoZW5jZSB0aGUgY2hvaWNlIG9mIDY0LWJpdC4KICsgICAgICAgICAgICAgICAgICAgIGxldCB2
YWwgPSB1NjQ6OmZyb21fc3RyX3JhZGl4KAogKyAgICAgICAgICAgICAgICAgICAgICAgIGNvcmU6
OnN0cjo6ZnJvbV91dGY4KGRpZ2l0cykubWFwX2Vycih8X3wgRUlOVkFMKT8sCiArICAgICAgICAg
ICAgICAgICAgICAgICAgcmFkaXgsCg==
--000000000000b4446b0631a0f4ea--

