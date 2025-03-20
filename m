Return-Path: <linux-kbuild+bounces-6259-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B48A6A39C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 11:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75D3816EEB7
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 10:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EF1224884;
	Thu, 20 Mar 2025 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhsvhQfJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38F2224253;
	Thu, 20 Mar 2025 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742466414; cv=none; b=OyXLbVgttAHRI952fjUsdwUapRfe7VDlQgt/TGkqZ9ewZmGEeZ3xgbpfX4FhfIR+CDoIc60qtWlY2CqvOii9FJOgjDEE5ipz9+boS7pjSiLH1S6cN3n3OBrZ3WQ1q1WrVrlt1EreVZ8tx1IHQHljLt0LCwBOL7U+9UbO30weutI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742466414; c=relaxed/simple;
	bh=2INiMlEgtKjR+OIVK8ORlyTWDnWHNjO8BiiHuQYIXlU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HNTkT4qNAB4WfO5S+XDnAsH6xQUSlbzdQDM3ilW6WBmC+Cdb3NDbGBLsxgJt3asbQx/ys30Y8AH5wJXnUushKmAMwuFQJq+oIFEmB0irbYqwWVOP2zlIEyV8KAJOoYFxBscvfMRl3/lT9ZSxYOaUFKMXrDZMy66BaUNqNDKio/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhsvhQfJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF74FC4CEDD;
	Thu, 20 Mar 2025 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742466413;
	bh=2INiMlEgtKjR+OIVK8ORlyTWDnWHNjO8BiiHuQYIXlU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JhsvhQfJVfPOA1EoFHN3t8VuXSJ4eRZfNzUeSFZMtkHbROzRIn4dpCSZDfSyU4dkz
	 JlDpEtYKrBKpc7x6kGh9zeBT1h6YVYY+HzHpFlNO2Ab2c/qdpk8sZff1tj5YPtJ81g
	 zlPEYDbKQmOLfGmk3U2trUuByJVu1We0UlN+5K03XOeCXAGevGaEgOvyhz4CPna4MJ
	 vDSaItWbqD9ve/fmZE41TmKT115ASYSsPK9Ow2cVySIWvJVIhvG/gfHlvPrdVvByyi
	 sF8doRPHMmY5c7IuFme3ktgNdTZPm81Z+1sDUYETQPY9DkRzC6MpuQdbNhUBh84Jbr
	 w2kWKuqs0g2DA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Daniel Gomez" <da.gomez@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Trevor Gross" <tmgross@umich.edu>,  "Adam
 Bratschi-Kaye" <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Sami
 Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v8 0/7] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <nh23cbbpf5yk6mafn7gz7urlau22egilideytnnh7paagusaih@t7y7q7jha4fz>
	(Daniel Gomez's message of "Thu, 20 Mar 2025 09:41:58 +0100")
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
	<Q_mSCTsSMDQ6DylWZTrkH1Wru3fQ1LFIiuk1pHElSsTc12fDdaCrgzWvEEQRE2_WBxOBzPuCE-qBJjw7LhHbjQ==@protonmail.internalid>
	<nh23cbbpf5yk6mafn7gz7urlau22egilideytnnh7paagusaih@t7y7q7jha4fz>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 20 Mar 2025 11:26:40 +0100
Message-ID: <87frj8dmlb.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Daniel Gomez" <da.gomez@kernel.org> writes:

> Hi,
> On Thu, Feb 27, 2025 at 03:38:06PM +0100, Andreas Hindborg wrote:
>> Extend the `module!` macro with support module parameters. Also add some string
>> to integer parsing functions and updates `BStr` with a method to strip a string
>> prefix.
>>
>> Based on code by Adam Bratschi-Kaye lifted from the original `rust` branch [1].
>>
>> Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> I've tested this series including the following patches from Andreas' tree [1]
> as dependency for module testing parameters with the Rust Null Block driver:
>
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git/log/?h=rnull-v6.14-rc1
>
> 51d304103b7f rust: refactor: rename `RawWriter` to `BufferWriter`
> 544811b24574 LIST: [PATCH v2 1/3] rust: sync: change `<Arc<T> as ForeignOwnable>::PointedTo` to `T`
> 3f097abd58de LIST: [PATCH v15 1/3] rust: types: add `ForeignOwnable::PointedTo`
> 0525eda0ff8d LIST: [PATCH v7 3/14] rust: sync: add `Arc::as_ptr`
> ce7343b48e63 LIST: [PATCH v2 2/3] rust: configfs: introduce rust support for configfs
> 6efae1a9a226 rust: rnull: add module parameter support
> b6545e0eaf94 rust: rnull: enable configuration via `configfs`
> 6a3bc0dc31d0 rust: rnull: move driver to separate directory
>
> * modinfo
> sudo modinfo rnull_mod
> filename:       /lib/modules/6.14.0-rc6-00015-g51d304103b7f/kernel/drivers/block/rnull/rnull_mod.ko
> author:         Andreas Hindborg
> description:    Rust implementation of the C null block driver
> license:        GPL v2
> name:           rnull_mod
> intree:         Y
> depends:
> vermagic:       6.14.0-rc6-00015-g51d304103b7f mod_unload modversions
> parm:           nr_devices:Number of devices to register (u64)
> parm:           bs:Block size (in bytes) (u32)
> parm:           rotational:Set the rotational feature for the device (0 for false, 1 for true). Default: 0 (u8)
> parm:           gb:Device capacity in MiB (u64)
>
> * Testing nr_devices parameter:
> sudo modprobe rnull_mod nr_devices=100
>
> sudo ls /dev/rnullb* | wc -l
> 100
>
> * Testing block size and capacity parameters:
> sudo rmmod rnull_mod
> sudo modprobe rnull_mod nr_devices=1 bs=512 gb=1024
>
> sudo fdisk -l /dev/rnullb0
> Disk /dev/rnullb0: 1 GiB, 1073741824 bytes, 2097152 sectors
> Units: sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
>
> * Testing block size with fio and blkalgn [1] (tool for validating driver block
> size):
>
> [1] blkalgn is an eBPF-based tool for tracing block operations that also reports
> block granularity and alignment histograms:
> https://github.com/dkruces/bcc/tree/blkalgn
>
> Install:
> https://github.com/dkruces/bcc/releases/latest/download/blkalgn-$(uname -m) \
> --output /usr/sbin/blkalgn \
> && sudo chmod +x /usr/sbin/blkalgn
>
> sudo modprobe rnull_mod nr_devices=1 bs=1024 gb=1024
> sudo curl --location \
>
> sudo blkalgn --disk=rnullb0 --ops=Write
> sudo fio --name=test --direct=1 --rw=write --bs=1024 --size=512k \
> --filename=/dev/rnullb0 --loop=1000
>
> I/O Granularity Histogram for Device rnullb0 (lbads: 10 - 1024 bytes)
> Total I/Os: 10748
>      Bytes         : count    distribution
>         1024       : 10748    |****************************************|
>
> I/O Alignment Histogram for Device rnullb0
>      Bytes               : count    distribution
>          0 -> 1          : 0        |                                        |
>          2 -> 3          : 0        |                                        |
>          4 -> 7          : 0        |                                        |
>          8 -> 15         : 0        |                                        |
>         16 -> 31         : 0        |                                        |
>         32 -> 63         : 0        |                                        |
>         64 -> 127        : 0        |                                        |
>        128 -> 255        : 0        |                                        |
>        256 -> 511        : 0        |                                        |
>        512 -> 1023       : 0        |                                        |
>       1024 -> 2047       : 10748    |****************************************|
>
> Tested-by: Daniel Gomez <da.gomez@samsung.com>
>
>
> Andreas, Petr, Miguel,
>
> Based on the discussion in v7, it seems that all these patches will go through
> the Rust tree. Is that correct? What would be missing from the module's side?
>
> I agree with Petr in that thread that if the changes are mostly limited to
> rust-module files, they can go through the module's tree. However, that is not
> the case yet.

As far as I understand, Miguel would take patch 1-5 for v6.15 and
modules would take patch 6-7 for v6.16. At least that is my
understanding from [1], @Petr and @Miguel please correct me if I am
wrong.


Best regards,
Andreas Hindborg

[1] https://lore.kernel.org/all/CANiq72mW94Y-bsJFMHqF8fbXhvAizEn7-NnxawTW+5brbxJHBg@mail.gmail.com



