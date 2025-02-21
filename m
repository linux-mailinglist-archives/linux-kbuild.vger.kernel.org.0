Return-Path: <linux-kbuild+bounces-5855-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91020A3FB14
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 17:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24BAA7A7B0A
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 16:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE6B1E491B;
	Fri, 21 Feb 2025 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BJ7hB8pc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD5D1E1C36;
	Fri, 21 Feb 2025 16:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740154600; cv=pass; b=t388+eFFEkX4bUBC/Cn6M6UvNpS/3Y8Otz6cnF2vRpmAzusB66o0wA7eHrMKU8kIvNZgX/nF87HuKlguwdge4PifWMED+EmTuc6VNlHKWdIIo8DiDN8HCz4Z/H/1zIXFjAq9YJiQ/+IwkNfyGLtDLv8mjPaScE+pVMbRpjKsOuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740154600; c=relaxed/simple;
	bh=jOzJHq8+4wQqwKjhyLa1Z3VwwS37RnvY9pGLMAgnTLw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=akP94vgUUU7ET04AQwui2LnUoZJZl0JC9PialSdzqJfb62oAsXUinIyMIktmGU8ctqGFnJM9XZi/aqWZtlyt6kgfe3IOk+LfmVvWpKbxq5coLGQcMtDzjgPLdMXrDsakRvqp799YtNTpIinAgMsS6dywNTYdpC3GPsJYO2ZOlpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=BJ7hB8pc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740154558; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VhLhNhUzP54DD6vMRPUo125BM+LXQgfPZ8gjRvb0QXfqJXYHeLIPSqFAOh4J6JqX+Z6Xw+utK0ii0MK+441qG3PmnMLWJYLlnXi8Vtw5zz78yRFE75WqS1ppi7zP7bQxcJAqYqF4VYhNU3KXdKdHomZUnTMzq29qcz9vJuC5LJM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740154558; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=l133VrdCg0Pj7Gbh3P0YhOoWAIun5QkcWnsNlg1Ey2Q=; 
	b=KRJWysobFndxVP6cjpeH0YS+35yOdhfGVTkmaHjdS2m+FSJHutDREdF8hw8JDAVEMaKVO72O8MUZE4jZwWR3Gzdg82bAc9ZexNoLk+kvjovq1P2XWqm5hcoLt+AilecYgS8tqtnbG/hAfnp3bsJ+PnxCOtACQwVpxIE9CgJ3u20=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740154558;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=l133VrdCg0Pj7Gbh3P0YhOoWAIun5QkcWnsNlg1Ey2Q=;
	b=BJ7hB8pcl/l/K0B9LTPrK4t63Ju6TTkaeS5mogSLaM/GhoXmCGnuwwNBDMt2bqt/
	rp3+6t8rMsfaYJraCvfNpIDNvjti4J6qOzLTdOrzgavHEnYSJwipxebx37B+HyyWBdD
	SpVtXZoAwbtGNFexAoJaEWDZDYdIp1itFEpnJpjY=
Received: by mx.zohomail.com with SMTPS id 174015455580945.3150431144137;
	Fri, 21 Feb 2025 08:15:55 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v7 3/6] rust: str: implement `AsRef<BStr>` for `[u8]` and
 `BStr`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <87372128-2734-4402-B46F-EF81ECEE546A@collabora.com>
Date: Fri, 21 Feb 2025 13:15:38 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Luis Chamberlain <mcgrof@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Adam Bratschi-Kaye <ark.email@gmail.com>,
 linux-kbuild@vger.kernel.org,
 Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>,
 linux-modules@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <94DA7409-439D-4D6B-98F5-687A743DB277@collabora.com>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
 <20250218-module-params-v3-v7-3-5e1afabcac1b@kernel.org>
 <87372128-2734-4402-B46F-EF81ECEE546A@collabora.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External



> On 21 Feb 2025, at 13:01, Daniel Almeida =
<daniel.almeida@collabora.com> wrote:
>=20
>=20
>=20
>> On 18 Feb 2025, at 10:00, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>>=20
>> Implement `AsRef<BStr>` for `[u8]` and `BStr` so these can be used
>> interchangeably for operations on `BStr`.
>>=20
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>> rust/kernel/str.rs | 12 ++++++++++++
>> 1 file changed, 12 insertions(+)
>>=20
>> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>> index ba6b1a5c4f99d..c6bd2c69543dc 100644
>> --- a/rust/kernel/str.rs
>> +++ b/rust/kernel/str.rs
>> @@ -125,6 +125,18 @@ fn index(&self, index: Idx) -> &Self::Output {
>>    }
>> }
>>=20
>> +impl AsRef<BStr> for [u8] {
>> +    fn as_ref(&self) -> &BStr {
>> +        BStr::from_bytes(self)
>> +    }
>> +}
>> +
>> +impl AsRef<BStr> for BStr {
>> +    fn as_ref(&self) -> &BStr {
>> +        self
>> +    }
>> +}
>=20
> Why do you need this last one?

I see that this is used by the following patch.

>=20
>> +
>> /// Creates a new [`BStr`] from a string literal.
>> ///
>> /// `b_str!` converts the supplied string literal to byte string, so =
non-ASCII
>>=20
>> --=20
>> 2.47.0

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>



