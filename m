Return-Path: <linux-kbuild+bounces-12637-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJDtIEAw0Gke4gYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12637-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 23:25:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E69193986AE
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 23:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA1313016514
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2026 21:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78D83D5656;
	Fri,  3 Apr 2026 21:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRoXO55O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932D4378839
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Apr 2026 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775251451; cv=pass; b=dIVr+Y1vJUi0aCe3NFMygi/2LabQ/O9BKUwiSmwOixFH3l0EvVUusV0y/tpO3JPgefBjbQdd3OP9bRTJAr1x7AvDBmIwUtwp6OUPhVvqlPJBEyd7Ae4FY88CNO4n3d5V719w+xsoje/V/A3d21Tz0mNY0owT/ngK4oUWgtHEfSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775251451; c=relaxed/simple;
	bh=Cs3nAqRjHjioxjYHhaJzVFtzKHaPCe2OYhO+RwJxfGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZveSPy1O1vXYistUjY8wkIkgwqdh8jufYBOduJw/FuIQ1Git5KCzpgDFnLx+6DTJ6EroMunDTxQdFLC+n4iNY2jsWZA8ZcdcE41sCBZByn9LTe1gDpTt/85TtDsTm7tJKX/m/JHGVf5NVmFmLvj8zHu+MjxvZG7r5gQ3VDe4brU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRoXO55O; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so78778eec.3
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2026 14:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775251449; cv=none;
        d=google.com; s=arc-20240605;
        b=HPiHhnvS+Lzy6Kw+1Iflo1upoUnHDxPGBor7FKOeFfbwBjGN4EohcZxJ3tE9LwdCQt
         hbs+jZTkl6GxwBq4Sc5+xyEldJ/3Wp/W+cwc5WOqQySHBKE5fkLoFVAy9wrzHCqrhYcq
         QpmspWigxuJWvYSDCMoo5lMKOJC8p+kw4ggtTsCb3Ylap+rmENd2AcK78Je/Hv8vH0fm
         2dHw6Db9rmj6siowYlcJbDesSc8DcYOYjHbONpj3iJYNcawneYpp5R2X/RmPk7KczBRC
         1BnJ1K6gIAioRyMSi9xWqo79JRysRuJjCsjnkqakWUN16x8SDOd/KqQtlQPGFj3zKj49
         n1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cs3nAqRjHjioxjYHhaJzVFtzKHaPCe2OYhO+RwJxfGQ=;
        fh=esufw6itFXDgO6A2JiNKsbcgFLjKyack6EkjPfpr510=;
        b=PWiFdJqM2ZzCjpnBlIZCeZ05w7ZguAB5UbU8QY+hFz71MwdtUXn/LG9BjILWnW+mQq
         EYODq9ZhN03VWKlu+zZSeV4LoOR6r4EtqhRb5jY9Qrtg6uH/aX0tnxyP/rbYXnH6kLLh
         Aj+S5IMZ8lIXuA8klQl8Jsr4N7HZLKqCsMkHmekyeGvVtFerwdn6roGiWjO4mzsrz5jl
         fYkJAJm0msB9v6FgCX9mgoymLp+VluuYy/Jh+Qr2zwnw1au/C7Bi+jnJIKyXhvhhBm4G
         XqbQne7Ij+oa02TB8Sa2b4wfMzS91ih+thxzbq81Q6nKXECHrHbRV/BHhsEvHANkpXPY
         hIEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775251449; x=1775856249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs3nAqRjHjioxjYHhaJzVFtzKHaPCe2OYhO+RwJxfGQ=;
        b=MRoXO55O/3wKUufhV3SSQkDEWLLF7sw+4UaSow6fSGuPaqpTLL3joUlLfqAIefncsx
         hmOOuDT4NsMh6dbicranaiy/KMHKd44INZdXmVsvQHuWkn8F+q/6PSTEtHh3++cj1zEz
         ixtkye5Hb5iHk6KcFg2z//zaU2mbBWJAVLQCwPEgLi3bGjU3P5aMJdbIfgQxXNY+9tQ9
         WqUHSj3kWddcy4W/sHeiIeiElH7guUfjdPJa52bD0j9qx0DcytjHoaOFFCcHIi6GoBc5
         0VzPPCPs5daxSp4VG2OJWfXIkOmRiKr3k1PE0m6AQTIdKb6WKdMxBPlDS5SU6ykcKSvF
         QRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775251449; x=1775856249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cs3nAqRjHjioxjYHhaJzVFtzKHaPCe2OYhO+RwJxfGQ=;
        b=ntNPZTu7yDLdD1aU69SVrco5MCjUIII7T7ML9L5vylOFv9SpWFlSHviDOBF42c7ioG
         SgCKN9+7BuqtWqyAnt5+CUMRsbnLf6J6CZsauf8/jDeJ/pkr9noLuiRtAt4xzl/WCv80
         pISdLI+/uJfIRVSnMNazR1WbpMqTmtZx2R476TFum1MPIipCmakG9GR7HI7yJKAv6YWv
         9wo5jQ27UlGirA8r3efIRq07AxA6g93FYG8NS9XDzom8H4ZCHxO+wKjh8zuiXXuQZIks
         0UDaZJOz5f9NLmsQ5uzRixJ0XBOSozfH5u8no6Gia1swWZA8KseE0uK+QoJTbj6q2330
         40QQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7WXiINUcjs07fgBsfedwMH6COoTUYo1kzMTPVQEvmRpkpf8r3NI7qiuRwsr0HnRPnVvAndNzk3mvVL2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzHLKbo3IAaKzaFAovoxrE/77aq6XqmEAZXyiz/+mAZmroxN+P
	PyWYe6tWdkqSyExWsx2dmFvg5vq+gtkLn8dGDcf/lsy8Wt1IMwBejx2wEYPIQSHWQpZWbi8k3At
	gtDtkWxsUP1Cd+KLhnk6AQybzqT9OKyk=
X-Gm-Gg: AeBDiev/fF6fRT46L9P8j8bEz73pB3BPvnhK1WRL3WKjHUIv7tNcGzW3UxzjfznwuZM
	w4uaK69zVefn3gC7DXW36KYJ5/9SBJ1vpZX2/+Am/Iq6tBQ2cfHKhCv8DrenLHwvJbNAO0oz6TS
	RTtyH5uM/lST+4/gtAw7r03nvpaYsB7Ksd9rSbYSiGYb2hDtIocJHF1EcLCbYNnPXzX+AoKz46G
	PIOXsI+T5PKdAI6giXn577U1yU/6llLsihwHM8jHxmoLImN4tGJj9WtPvytMAh0tpgSl9y6KWQ/
	KuqTqVsE1DzWpqlrCobbPtlLVInDX6EaS+wgARcyVTuNbUNEOBB/MtmZVP9knhmz03px7oJpIDT
	QRQRadMUo93SFNoxuHBffpAc=
X-Received: by 2002:a05:7301:d1b:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2cbfcd54f9bmr1105240eec.7.1775251448669; Fri, 03 Apr 2026
 14:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <20260331205849.498295-2-ojeda@kernel.org>
 <CANiq72kNqmGpFurRy2X+a=9fHV_hxpfWBJ-+dEL_qj2daLM8ww@mail.gmail.com> <CABCJKucPKB-ntYi=EzPqyypy0kEHwnZvEvCEyjdQUWqfeAnGig@mail.gmail.com>
In-Reply-To: <CABCJKucPKB-ntYi=EzPqyypy0kEHwnZvEvCEyjdQUWqfeAnGig@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 23:23:55 +0200
X-Gm-Features: AQROBzB3MUuJJ3FThSbyL0_qVKcvYvwi_z1x37J_iBtfZ4z7dOAlfjoh1a-7qKA
Message-ID: <CANiq72==CZDMbjq0VE1e0ov7uLoSDBs_g3TR8S=EfsyC-m0mUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: macros: simplify `format!` arguments
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12637-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,atomlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E69193986AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026 at 5:53=E2=80=AFPM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> Sounds good to me, thanks.
>
> Acked-by: Sami Tolvanen <samitolvanen@google.com>

Great, I have added the tag now -- thanks!

Cheers,
Miguel

