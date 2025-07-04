Return-Path: <linux-kbuild+bounces-7872-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D42AF898C
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 09:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1D5B1CA0E38
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 07:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB2A28314D;
	Fri,  4 Jul 2025 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="om232DeH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88843281526;
	Fri,  4 Jul 2025 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614199; cv=none; b=ruFqBrptrAq6dSFtDydwCGcvsV+r5EywIvsYIcVCqdwP2sUOVA9LXSIYmt3IFeFP1l68YSWHpyo6l9M7UrIowQGeBJ32RbYDprAlXppktZZ+2UQGKZcJh77xT9yN4lv1xf/6BFfak6O7/rB+r75yi7PSYHS+HjDt1JiAHEYc0+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614199; c=relaxed/simple;
	bh=J6oObOUfBk6ZQPCzbxTZW8EADuP4lY171WCHLvpfXDc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fuqLX4l6ug8cBTsI9joBVZeAYH4LK/MFsTw6jHCJ2BA8ND9qU5mxRNCQooHN1pymCyaF4nxE4FcmytgGVyLg2gg8LNIoqSsQ4bWLt+qkezYVhzNaa4w5CyV4YIaXAXUAyJdfhIMhhDXqoRHhHCjElXTDaRATIBT3knKceYLwFqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=om232DeH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D91C4CEED;
	Fri,  4 Jul 2025 07:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751614199;
	bh=J6oObOUfBk6ZQPCzbxTZW8EADuP4lY171WCHLvpfXDc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=om232DeHuhVU1ZFkNBkvr5sHf3gJYD4vQjRdT92JreUGWaOll2JZAYmASAWSwi3De
	 SLU2edFQmnwqyytE3BMgwwq0Fk6uEDvOLchQzHwKHezdF6uWNuMA1cBFusmtHwYJUi
	 +mGoVLqu82csbeo2UD/6eicICFFjJEhERC1g3L4mzvg0MjhkW15/yRaDlBl1C2tR7n
	 +ZVHXgz+pqNVjVUCk/jaWKlntYC0AdDO+MvHaaLRNfOw0cBptH0FfRrA3c4cgDzJ5a
	 GUFpyMqaZCtoNaBYkt49zhzSpUDCRkWUP5yLA4mqvqc3+Q40CUNAlonw+FNLGdDOBl
	 KfOSRhXqCshMQ==
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
In-Reply-To: <0e89892f-103e-4b92-a067-e192cb7b89a6@kernel.org> (Danilo
	Krummrich's message of "Thu, 03 Jul 2025 23:49:47 +0200")
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
	<20250702-module-params-v3-v14-3-5b1cc32311af@kernel.org>
	<aOJo8e9FTJikY-WFnv8a7qAvQS6RFIHTU_gb8fa9RD-8SdGo7o56AoSlWUJUG9NTNB1Wgd09N4p5LJEY8HHXvQ==@protonmail.internalid>
	<0e89892f-103e-4b92-a067-e192cb7b89a6@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 04 Jul 2025 09:29:48 +0200
Message-ID: <875xg8tnv7.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> On 7/2/25 3:18 PM, Andreas Hindborg wrote:
>> +    /// Get a shared reference to the parameter value.
>> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
>> +    // held lock guard here.
>> +    pub fn get(&self) -> &T {
>> +        self.value.as_ref().unwrap_or(&self.default)
>> +    }
>
> I think you forgot to rename this.

Yes, thanks for being persistent on this :)


Best regards,
Andreas Hindborg



