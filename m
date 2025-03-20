Return-Path: <linux-kbuild+bounces-6257-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BACE1A6A19B
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 09:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E580188B53F
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 08:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0666214814;
	Thu, 20 Mar 2025 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqMMwdvq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB8721420B;
	Thu, 20 Mar 2025 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742460121; cv=none; b=JmdpL/xrOdu20Vi0P2DImq0xRKATGjtEcQSVT8f1a8p+FAuidHrvN1KfqYcCSRrjaHL9Yj714Ke2RH+OPhW9H+9mZkSaEa5w6eubq3jiaZRhzbTqPfmCett30I9xixRNQavpF7+0DZAt+uVF3+LaGjXTRBKxfHB0WYhVwjdgNqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742460121; c=relaxed/simple;
	bh=Pxon9jKBOoPJ78jE3zH31/v+sYZJ+86XYVNJMZpkgjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMmCB3DjI/kcv2tyCX9NWK2Yo3DewtrapfKkjI7SNK8SpLf8X9gZSOqgygEM67249q65JzKEbwV0Yygd/z/zF4+bg+AeWmZKCM9K9fVpkqtqHO9LHjESJD0Ezkb94qXYUqWojK51AudMrI6xJRCm9QHAE0x9x1yOBw1uRANeJAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqMMwdvq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6718C4CEDD;
	Thu, 20 Mar 2025 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742460121;
	bh=Pxon9jKBOoPJ78jE3zH31/v+sYZJ+86XYVNJMZpkgjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqMMwdvqwyDoSHFGxlmdqW0hUzbCJMMBqnmVo6QnikM6BNYX90vCjvr4a0Zzk1ulD
	 ReI5YOpesCG7T9HtIF0RV8v0fXxTn2pXVwUBw/bmTtkuybx4c93fZfMs6z1ihm4tdM
	 5YQF68j7tyNguPx7Kw9NNmUSnN6dJkJGMMrkCKd+KHWNNHWIuDN9RVKYi/u7AWRbGD
	 9bnVlhqvqFO+FEZVWwAhPTwBbjZ8hrGHmlCSgUiYU5k9BThyNz8OLVVt21/Oor1NHG
	 zZDL8q/s6TgjyOm8LgevmCTSLwyFlikjNB2HobaL+nX1B5nwS+Eaunb1uxh+WvtQ2F
	 QPSP0XBRpLpsQ==
Date: Thu, 20 Mar 2025 09:41:58 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Luis Chamberlain <mcgrof@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye <ark.email@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, 
	Fiona Behrens <me@kloenk.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-modules@vger.kernel.org
Subject: Re: [PATCH v8 0/7] rust: extend `module!` macro with integer
 parameter support
Message-ID: <nh23cbbpf5yk6mafn7gz7urlau22egilideytnnh7paagusaih@t7y7q7jha4fz>
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>

Hi, 
On Thu, Feb 27, 2025 at 03:38:06PM +0100, Andreas Hindborg wrote:
> Extend the `module!` macro with support module parameters. Also add some string
> to integer parsing functions and updates `BStr` with a method to strip a string
> prefix.
> 
> Based on code by Adam Bratschi-Kaye lifted from the original `rust` branch [1].
> 
> Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I've tested this series including the following patches from Andreas' tree [1]
as dependency for module testing parameters with the Rust Null Block driver:

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git/log/?h=rnull-v6.14-rc1

51d304103b7f rust: refactor: rename `RawWriter` to `BufferWriter`
544811b24574 LIST: [PATCH v2 1/3] rust: sync: change `<Arc<T> as ForeignOwnable>::PointedTo` to `T`
3f097abd58de LIST: [PATCH v15 1/3] rust: types: add `ForeignOwnable::PointedTo`
0525eda0ff8d LIST: [PATCH v7 3/14] rust: sync: add `Arc::as_ptr`
ce7343b48e63 LIST: [PATCH v2 2/3] rust: configfs: introduce rust support for configfs
6efae1a9a226 rust: rnull: add module parameter support
b6545e0eaf94 rust: rnull: enable configuration via `configfs`
6a3bc0dc31d0 rust: rnull: move driver to separate directory

* modinfo
sudo modinfo rnull_mod
filename:       /lib/modules/6.14.0-rc6-00015-g51d304103b7f/kernel/drivers/block/rnull/rnull_mod.ko
author:         Andreas Hindborg
description:    Rust implementation of the C null block driver
license:        GPL v2
name:           rnull_mod
intree:         Y
depends:
vermagic:       6.14.0-rc6-00015-g51d304103b7f mod_unload modversions
parm:           nr_devices:Number of devices to register (u64)
parm:           bs:Block size (in bytes) (u32)
parm:           rotational:Set the rotational feature for the device (0 for false, 1 for true). Default: 0 (u8)
parm:           gb:Device capacity in MiB (u64)

* Testing nr_devices parameter:
sudo modprobe rnull_mod nr_devices=100

sudo ls /dev/rnullb* | wc -l
100

* Testing block size and capacity parameters:
sudo rmmod rnull_mod
sudo modprobe rnull_mod nr_devices=1 bs=512 gb=1024

sudo fdisk -l /dev/rnullb0
Disk /dev/rnullb0: 1 GiB, 1073741824 bytes, 2097152 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

* Testing block size with fio and blkalgn [1] (tool for validating driver block
size):

[1] blkalgn is an eBPF-based tool for tracing block operations that also reports
block granularity and alignment histograms:
https://github.com/dkruces/bcc/tree/blkalgn

Install:
https://github.com/dkruces/bcc/releases/latest/download/blkalgn-$(uname -m) \
--output /usr/sbin/blkalgn \
&& sudo chmod +x /usr/sbin/blkalgn

sudo modprobe rnull_mod nr_devices=1 bs=1024 gb=1024
sudo curl --location \

sudo blkalgn --disk=rnullb0 --ops=Write
sudo fio --name=test --direct=1 --rw=write --bs=1024 --size=512k \
--filename=/dev/rnullb0 --loop=1000

I/O Granularity Histogram for Device rnullb0 (lbads: 10 - 1024 bytes)
Total I/Os: 10748
     Bytes         : count    distribution
        1024       : 10748    |****************************************|

I/O Alignment Histogram for Device rnullb0
     Bytes               : count    distribution
         0 -> 1          : 0        |                                        |
         2 -> 3          : 0        |                                        |
         4 -> 7          : 0        |                                        |
         8 -> 15         : 0        |                                        |
        16 -> 31         : 0        |                                        |
        32 -> 63         : 0        |                                        |
        64 -> 127        : 0        |                                        |
       128 -> 255        : 0        |                                        |
       256 -> 511        : 0        |                                        |
       512 -> 1023       : 0        |                                        |
      1024 -> 2047       : 10748    |****************************************|

Tested-by: Daniel Gomez <da.gomez@samsung.com>


Andreas, Petr, Miguel,

Based on the discussion in v7, it seems that all these patches will go through
the Rust tree. Is that correct? What would be missing from the module's side?

I agree with Petr in that thread that if the changes are mostly limited to
rust-module files, they can go through the module's tree. However, that is not
the case yet.

Daniel

> ---
> Changes in v8:
> - Change print statement in sample to better communicate parameter name.
> - Use imperative mode in commit messages.
> - Remove prefix path from `EINVAL`.
> - Change `try_from_param_arg` to accept `&BStr` rather than `&[u8]`.
> - Parse integers without 128 bit integer types.
> - Seal trait `FromStrRadix`.
> - Strengthen safety requirement of `set_param`.
> - Remove comment about Display and `PAGE_SIZE`.
> - Add note describing why `ModuleParamAccess` is pub.
> - Typo and grammar fixes for documentation.
> - Update MAINTAINERS with rust module files.
> - Link to v7: https://lore.kernel.org/r/20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org
> 
> Changes in v7:
> - Remove dependency on `pr_warn_once` patches, replace with TODO.
> - Rework `ParseInt::from_str` to avoid allocating.
> - Add a comment explaining how we parse "0".
> - Change trait bound on `Index` impl for `BStr` to match std library approach.
> - Link to v6: https://lore.kernel.org/r/20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org
> 
> Changes in v6:
> - Fix a bug that prevented parsing of negative default values for
>   parameters in the `module!` macro.
> - Fix a bug that prevented parsing zero in `strip_radix`. Also add a
>   test case for this.
> - Add `AsRef<BStr>` for `[u8]` and `BStr`.
> - Use `impl AsRef<BStr>` as type of prefix in `BStr::strip_prefix`.
> - Link to v5: https://lore.kernel.org/r/20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org
> 
> Changes in v5:
> - Fix a typo in a safety comment in `set_param`.
> - Use a match statement in `parse_int::strip_radix`.
> - Add an implementation of `Index` for `BStr`.
> - Fix a logic inversion bug where parameters would not be parsed.
> - Use `kernel::ffi::c_char` in `set_param` rather than the one in `core`.
> - Use `kernel::c_str!` rather than `c"..."` literal in module macro.
> - Rebase on v6.14-rc1.
> - Link to v4: https://lore.kernel.org/r/20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org
> 
> Changes in v4:
> - Add module maintainers to Cc list (sorry)
> - Add a few missing [`doc_links`]
> - Add panic section to `expect_string_field`
> - Fix a typo in safety requirement of `module_params::free`
> - Change `assert!` to `pr_warn_once!` in `module_params::set_param`
> - Remove `module_params::get_param` and install null pointer instead
> - Remove use of the unstable feature `sync_unsafe_cell`
> - Link to v3: https://lore.kernel.org/r/20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org
> 
> Changes in v3:
> - use `SyncUnsafeCell` rather than `static mut` and simplify parameter access
> - remove `Display` bound from `ModuleParam`
> - automatically generate documentation for `PARAM_OPS_.*`
> - remove `as *const _ as *mut_` phrasing
> - inline parameter name in struct instantiation in  `emit_params`
> - move `RacyKernelParam` out of macro template
> - use C string literals rather than byte string literals with explicit null
> - template out `__{name}_{param_name}` in `emit_param`
> - indent template in `emit_params`
> - use let-else expression in `emit_params` to get rid of an indentation level
> - document `expect_string_field`
> - move invication of `impl_int_module_param` to be closer to macro def
> - move attributes after docs in `make_param_ops`
> - rename `impl_module_param` to impl_int_module_param`
> - use `ty` instead of `ident` in `impl_parse_int`
> - use `BStr` instead of `&str` for string manipulation
> - move string parsing functions to seperate patch and add examples, fix bugs
> - degrade comment about future support from doc comment to regular comment
> - remove std lib path from `Sized` marker
> - update documentation for `trait ModuleParam`
> - Link to v2: https://lore.kernel.org/all/20240819133345.3438739-1-nmi@metaspace.dk/
> 
> Changes in v2:
> - Remove support for params without values (`NOARG_ALLOWED`).
> - Improve documentation for `try_from_param_arg`.
> - Use prelude import.
> - Refactor `try_from_param_arg` to return `Result`.
> - Refactor `ParseInt::from_str` to return `Result`.
> - Move C callable functions out of `ModuleParam` trait.
> - Rename literal string field parser to `expect_string_field`.
> - Move parameter parsing from generation to parsing stage.
> - Use absolute type paths in macro code.
> - Inline `kparam`and `read_func` values.
> - Resolve TODO regarding alignment attributes.
> - Remove unnecessary unsafe blocks in macro code.
> - Improve error message for unrecognized parameter types.
> - Do not use `self` receiver when reading parameter value.
> - Add parameter documentation to `module!` macro.
> - Use empty `enum` for parameter type.
> - Use `addr_of_mut` to get address of parameter value variable.
> - Enabled building of docs for for `module_param` module.
> - Link to v1: https://lore.kernel.org/rust-for-linux/20240705111455.142790-1-nmi@metaspace.dk/
> 
> ---
> Andreas Hindborg (7):
>       rust: str: implement `PartialEq` for `BStr`
>       rust: str: implement `Index` for `BStr`
>       rust: str: implement `AsRef<BStr>` for `[u8]` and `BStr`
>       rust: str: implement `strip_prefix` for `BStr`
>       rust: str: add radix prefixed integer parsing functions
>       rust: add parameter support to the `module!` macro
>       modules: add rust modules files to MAINTAINERS
> 
>  MAINTAINERS                  |   2 +
>  rust/kernel/lib.rs           |   1 +
>  rust/kernel/module_param.rs  | 221 +++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/str.rs           | 200 +++++++++++++++++++++++++++++++++++++++
>  rust/macros/helpers.rs       |  25 +++++
>  rust/macros/lib.rs           |  31 ++++++
>  rust/macros/module.rs        | 191 +++++++++++++++++++++++++++++++++----
>  samples/rust/rust_minimal.rs |  10 ++
>  8 files changed, 663 insertions(+), 18 deletions(-)
> ---
> base-commit: 379487e17ca406b47392e7ab6cf35d1c3bacb371
> change-id: 20241211-module-params-v3-ae7e5c8d8b5a
> 
> Best regards,
> -- 
> Andreas Hindborg <a.hindborg@kernel.org>
> 
> 

