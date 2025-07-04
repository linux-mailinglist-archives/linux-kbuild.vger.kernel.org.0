Return-Path: <linux-kbuild+bounces-7873-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E837AF89A3
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 09:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30A5B3BFD5C
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 07:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E9A27F759;
	Fri,  4 Jul 2025 07:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKKbs7Xs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7137427F75F;
	Fri,  4 Jul 2025 07:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614657; cv=none; b=O7lI5FJaH1nsh3yXp2KAbL7ddYYXsMUtKPXEKVmoOBQwKa+HnQhn7XPZhd1b8azOxMhnpuYaRXTOs2vYp/QYU6a+mRMbCLSJHZqPkmpcCTr7lN70Grcd9tAMBegjsFWohc+u6Wsap7WjbJ32jAWJW79lC1YqqRb9DwAqHLvIVpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614657; c=relaxed/simple;
	bh=Bwsw9LbOGOJT3bRp+bvb8W348cGEpDFgUqMB5Fyqu7Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iIOaRbkzwX56ob0ouv91ptXkAt4fpeTdnFaNCoTkSonpNQ2ydPZ8+VHNHoM21V6NY2YRCq1I/nNJmsT8fJ/Aq1g3E2aUwcYhu4iQmzg2dg98j6TD6rit+mDrYtjtNo/FkugCaRKFnqtKr1NxXAf9NquagZhNxpWCYCm1dJ2IZQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKKbs7Xs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2A8C4CEE3;
	Fri,  4 Jul 2025 07:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751614655;
	bh=Bwsw9LbOGOJT3bRp+bvb8W348cGEpDFgUqMB5Fyqu7Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aKKbs7XszlrkErZmfUWSDP3eH7hCkfiAp5s+RwgjbwJ5Mff9sVyuCXmcN1/vDISmD
	 +vQVlAgrfl5lMAHc+H0sIRKcbClHztH/lduYF6W1q7aFPXAnqU6SX1wylf0Fz+Wssb
	 p+MuhjxU3PIidiOVqXYDyUnfnSt2rJQ77tyDF3WX/ITZSNpod6nTTxvQcqLcZbNPVm
	 wgx5dlHOZUZ3N7g9rIK+ngycpnHgULLWevYsIt+CZxBsnS2pUPCVp2+PTxoQX+ebK0
	 sn7mMmFwUlzDA1/vBfwLQwOoYVE8k+/2brwl1vluiAFgeAqknoZu916tx4uFvUnTAv
	 lAKXH/vaseNMw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Benno Lossin" <lossin@kernel.org>,  "Nicolas
 Schier" <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v14 3/7] rust: introduce module_param module
In-Reply-To: <875xg8tnv7.fsf@kernel.org> (Andreas Hindborg's message of "Fri,
	04 Jul 2025 09:29:48 +0200")
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
	<20250702-module-params-v3-v14-3-5b1cc32311af@kernel.org>
	<aOJo8e9FTJikY-WFnv8a7qAvQS6RFIHTU_gb8fa9RD-8SdGo7o56AoSlWUJUG9NTNB1Wgd09N4p5LJEY8HHXvQ==@protonmail.internalid>
	<0e89892f-103e-4b92-a067-e192cb7b89a6@kernel.org>
	<875xg8tnv7.fsf@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 04 Jul 2025 09:37:25 +0200
Message-ID: <87zfdks8y2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Danilo Krummrich" <dakr@kernel.org> writes:
>
>> On 7/2/25 3:18 PM, Andreas Hindborg wrote:
>>> +    /// Get a shared reference to the parameter value.
>>> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
>>> +    // held lock guard here.
>>> +    pub fn get(&self) -> &T {
>>> +        self.value.as_ref().unwrap_or(&self.default)
>>> +    }
>>
>> I think you forgot to rename this.
>
> Yes, thanks for being persistent on this :)

Actually, there is a discussion on whether to keep the API similar to
`std::sync::OnceLock` [1] but also whether to rename this to something
other than `OnceLock` [2]. Depending on how that resolves, it might make
sense to stay with `get` or rename to something else.


Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/all/35e1fef4-b715-4827-a498-bdde9b58b51c@penguintechs.org
[2] https://lore.kernel.org/all/CAH5fLggY2Ei14nVJzLBEoR1Rut1GKU4SZX=+14tuRH1aSuQVTA@mail.gmail.com




