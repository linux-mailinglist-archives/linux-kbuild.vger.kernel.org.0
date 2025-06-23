Return-Path: <linux-kbuild+bounces-7615-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951BAE3AFF
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 11:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03AA7162B7D
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 09:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25D023278D;
	Mon, 23 Jun 2025 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kx05u67J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F292A1AA;
	Mon, 23 Jun 2025 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672074; cv=none; b=sQWHkl9v7IT+Y+dR+39Al8vtPlec3yRsgYQvAj3f6S+dRh2g+2v5DcVR0yJtkbUnSdTiCj75jBbS1AoPOQdD980HSZuQBd9nJ0nqTG8fjAsGTWEBLbjZKrKGT9sSWNL4vPKvRWJ5xMFvXPMpkFSNWWaV97gtZ+2BRRj4FskZ5N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672074; c=relaxed/simple;
	bh=M3wDsMVnMxBIbp4y9+JARPWxPf7DiKPaxlrwuAYYhwA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EYjdgj4AJG+GGmB/7c+zLfY0exBVfHp5++YP/b+sOiHOnqS5/Gf1eWDchuy6a/idlRneUWtVQgP+k7FPhSxiUlwBvPkffzPob6dTXKL9wFR2bpJWkVjiweB2/Htvc/edrnFXFuIRkSDxFtvsKAhum2FwV6MVHnC9J3qaavaM5xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kx05u67J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58121C4CEEA;
	Mon, 23 Jun 2025 09:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750672074;
	bh=M3wDsMVnMxBIbp4y9+JARPWxPf7DiKPaxlrwuAYYhwA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Kx05u67J4F1GId/vsrq7rWKFpNiVGyI1JPp1Ht+PYbIAwnv++MQHoHwUz08gtWw/1
	 quwpo80CiM9ZJRLn3IsHrU1JLrkSAqziq23Ns3XbuswrR/daGQFAB1FZGwmrsdEtWa
	 3pYMQ85laE6M65/1Z7f11+oAqOiAkyGjAoKh7qD+FdnMMLBJS6YNQvmXUi2ThN4eFJ
	 jHJRLlb8NJ79v1ezaiU9teqmgTiN6o1/KzE8z3WW5RmhGd3rsXsM2ARWXQKLGciFXO
	 H9zdPQBsbbUX/qNc+lNt+kXABf3ZUazVDOcat6nQFy/eU+wbwHnZ0xveKPAdcJHthj
	 nYdVlZsef8uWA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,  "Nicolas
 Schier" <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
In-Reply-To: <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> (Benno Lossin's message
	of "Fri, 20 Jun 2025 14:28:44 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
	<COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid>
	<DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org>
	<smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid>
	<DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 23 Jun 2025 11:47:43 +0200
Message-ID: <871pra6b7k.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Fri Jun 20, 2025 at 1:29 PM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>>>> +/// A wrapper for kernel parameters.
>>>> +///
>>>> +/// This type is instantiated by the [`module!`] macro when module parameters are
>>>> +/// defined. You should never need to instantiate this type directly.
>>>> +///
>>>> +/// Note: This type is `pub` because it is used by module crates to access
>>>> +/// parameter values.
>>>> +#[repr(transparent)]
>>>> +pub struct ModuleParamAccess<T> {
>>>> +    data: core::cell::UnsafeCell<T>,
>>>> +}
>>>> +
>>>> +// SAFETY: We only create shared references to the contents of this container,
>>>> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
>>>> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
>>>> +
>>>> +impl<T> ModuleParamAccess<T> {
>>>> +    #[doc(hidden)]
>>>> +    pub const fn new(value: T) -> Self {
>>>> +        Self {
>>>> +            data: core::cell::UnsafeCell::new(value),
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /// Get a shared reference to the parameter value.
>>>> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
>>>> +    // held lock guard here.
>>>> +    pub fn get(&self) -> &T {
>>>> +        // SAFETY: As we only support read only parameters with no sysfs
>>>> +        // exposure, the kernel will not touch the parameter data after module
>>>> +        // initialization.
>>>
>>> This should be a type invariant. But I'm having difficulty defining one
>>> that's actually correct: after parsing the parameter, this is written
>>> to, but when is that actually?
>>
>> For built-in modules it is during kernel initialization. For loadable
>> modules, it during module load. No code from the module will execute
>> before parameters are set.
>
> Gotcha and there never ever will be custom code that is executed
> before/during parameter setting (so code aside from code in `kernel`)?

Not with the parameter parsers we provide now. In the case of custom
parsing code, I suppose there is nothing preventing the parsing code
from spinning up a thread that could do stuff while more parameters are
initialized by the kernel.


Best regards,
Andreas Hindborg



