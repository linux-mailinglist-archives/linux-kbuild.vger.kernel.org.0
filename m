Return-Path: <linux-kbuild+bounces-9363-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5481AC29712
	for <lists+linux-kbuild@lfdr.de>; Sun, 02 Nov 2025 22:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EBC254E252C
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Nov 2025 21:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FFD17A30A;
	Sun,  2 Nov 2025 21:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NccM65dZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6138F9EC;
	Sun,  2 Nov 2025 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762118352; cv=none; b=UJZpgMcRvLeTj4yD+WJVcy16tA002OnY85o+tbBSFKbbJOoP1n9P2TBqjdIpUuWhfdf0uEj1Pm1uhTAvr1AN7pewMdSdQsXnbl9aZT0dRXYwXx3Ineem+cA5GZwk7ObDsgmINgOjzK5iOazUaIFsRzRO9S/jb3j05WGBNJf6W/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762118352; c=relaxed/simple;
	bh=34GY/EryjbHN5WFBiDBi5ct9qc1OmmQhzgRsTlTXYwM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lHBO3vystXEZ+Vf89fr+oG5226K3IwShtYHkt7U1S46e3i65KPKzDkHeqs0/qnSyQs50ZWPxAZRQEvchroz9QyL74MVUyMIu+DOW4ZEyuj7hZj+F0bCim7aN6OwlCAr/fnDRtshv5tYao4eEaHrdqBM2l3muOxC2cBPMrr7+PLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NccM65dZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CD4C4CEF7;
	Sun,  2 Nov 2025 21:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762118350;
	bh=34GY/EryjbHN5WFBiDBi5ct9qc1OmmQhzgRsTlTXYwM=;
	h=Date:From:Subject:Reply-To:To:Cc:References:In-Reply-To:From;
	b=NccM65dZGg165dqrDeKOS5CWrDvwh1qIrgVMIYtXEXEZnEVqGZtEOqMuMrUWP/wCv
	 HloZm/gSD6DJWVQtc/bcM1bcKh8cG4SsXI+5qPJcUA71w08r5EMU86UYCoMnX31j+E
	 bHMWIcalk2XIDKsSMx8UgbyYVRLTtYPdZC/rpKgqAttoWF1Roy8h0yGCkvtSk8POct
	 vacwRG/YQKRWOij0QW1NudOMumMonsEBWbbvjI4VjJnePDGSz2QIB+dp3j4Kh9dXUX
	 uEuvCt8lRiDezYp+jMGh5rCohNr/B41G6JjMkcPtTr+1y2TnKbgew55ka2ewlLLHVz
	 s4sIcgo3t5IWA==
Message-ID: <e74f2c14-2642-4d5c-a076-adee8506d2c5@kernel.org>
Date: Sun, 2 Nov 2025 22:19:02 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [PATCH v18 0/7] rust: extend `module!` macro with integer
 parameter support
Reply-To: Daniel Gomez <da.gomez@kernel.org>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye <ark.email@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 linux-modules@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-next@vger.kernel.org
References: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
 <49af6d76-bcb7-4343-8903-390040e2c49b@kernel.org>
 <er7h34im2rk627usnvbre3clqvsx3uzev7kboy33pd7oac747c@nvtl7y2mmdde>
Content-Language: en-US
Organization: kernel.org
In-Reply-To: <er7h34im2rk627usnvbre3clqvsx3uzev7kboy33pd7oac747c@nvtl7y2mmdde>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/11/2025 10.56, Uwe Kleine-KÃ¶nig wrote:
> Hello Daniel,
> 
> [Adding Stephen and linux-next to Cc]
> 
> On Sat, Nov 01, 2025 at 10:39:08PM +0100, Daniel Gomez wrote:
>> On 24/09/2025 14.39, Andreas Hindborg wrote:
>>> Extend the `module!` macro with support module parameters. Also add some
>>> string to integer parsing functions.
>>>
>>> Based on the original module parameter support by Miguel [1],
>>> later extended and generalized by Adam for more types [2][3].
>>> Originally tracked at [4].
>>>
>>> Link: https://github.com/Rust-for-Linux/linux/pull/7 [1]
>>> Link: https://github.com/Rust-for-Linux/linux/pull/82 [2]
>>> Link: https://github.com/Rust-for-Linux/linux/pull/87 [3]
>>> Link: https://github.com/Rust-for-Linux/linux/issues/11 [4]
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>> I tested this series with rust_minimal module. They LGTM,
>>
>> Tested-by: Daniel Gomez <da.gomez@samsung.com>
>>
>> The patches did not apply cleanly to v6.18-rc3, at least not when using b4.
>> However, when applying them to the base commit and then rebasing onto v6.18-rc3,
>> I didn't see any conflicts.
> 
> I don't know how you use b4, but
> 
> 	git checkout v6.18-rc3
> 	b4 am -3 49af6d76-bcb7-4343-8903-390040e2c49b@kernel.org
> 	git am -3 ./v18_20250924_a_hindborg_rust_extend_module_macro_with_integer_parameter_support.mbx
> 
> works fine on my end. Using `-3` should have the same effect as applying
> the series on top of the original base and rebase it.

Right, that's what I did but manually. I didn't know about that argument :).

> 
> 	git fetch https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git rebase/20250924-module-params-v3-v18-0-bf512c35d910@kernel.org
> 	git range-diff FETCH_HEAD...HEAD
> 
> confirms that.
>  
>> I've created a temporary branch with this rebase here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git/log/?h=rebase/20250924-module-params-v3-v18-0-bf512c35d910@kernel.org
>>
>> Can you take a look when you can? I'll merge this shortly after checking with
>> Uwe, as there are some minor conflicts with his tree.
>>
>> + Uwe
>>
>> These are the conflicts I see when merging the patch series from Michal [1]
>> (Introduce import_ns support for Rust). I believe these are trivial things that
>> we will get notified from linux-next merging. But let me know what you think as
>> you have requested in that thread.
>>
>> [1] Link: https://lore.kernel.org/all/20251028-pwm_fixes-v1-0-25a532d31998@samsung.com/
> 
> Yeah, I expect that Stephen will highlight the conflicts, but I prefer
> to not be surprised by that and consider linux-next more a fallback
> security net that I don't want to use. I like it to be the other way
> round and tell Stephen about conflicts to expect :-)

Please Stephen, check the proposed changes below. I plan to merge this series in
modules' tree and it will conflict with Uwe's tree on rust/macros/module.rs file.

> 
>> ...
>> Applying: rust: macros: Add support for 'imports_ns' to module!
>> Patch failed at 0008 rust: macros: Add support for 'imports_ns' to module!
>> error: patch failed: rust/macros/module.rs:98
>> error: rust/macros/module.rs: patch does not apply
>> hint: Use 'git am --show-current-patch=diff' to see the failed patch
>> hint: When you have resolved this problem, run "git am --continue".
>> hint: If you prefer to skip this patch, run "git am --skip" instead.
>> hint: To restore the original branch and stop patching, run "git am --abort".
>> hint: Disable this message with "git config set advice.mergeConflict false"
>>
>> git am --show-current-patch=diff
> 
> That command shows the patch to apply, but not the conflict, let alone
> your resolution.
> 
>> ---
>>  rust/macros/module.rs | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> ---
>>  rust/macros/module.rs | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
>> index 5ee54a00c0b65699596e660b2d4d60e64be2a50c..408cd115487514c8be79724d901c676435696376 100644
>> --- a/rust/macros/module.rs
>> +++ b/rust/macros/module.rs
>> @@ -98,6 +98,7 @@ struct ModuleInfo {
>>      description: Option<String>,
>>      alias: Option<Vec<String>>,
>>      firmware: Option<Vec<String>>,
>> +    imports_ns: Option<Vec<String>>,
>>  }
> 
> So here the addition of `params` is missing.
> 
>> [...]
> 
> When I merge your branch mentioned above with my pwm/for-next and
> resolve the merge conflicts, the resolution looks as follows. The only
> non-trivial thing is that
> 
> 	if let Some(imports) = info.imports_ns {
> 
> now needs a & for `info`.

Correct.

In case it's necessary, I've merged your changes into the modules's -next
branch and attach the diff for you and Stephen. Not sure which order trees are
taken/merged, though.

> 
> Best regards
> Uwe
> 
> diff --cc rust/macros/module.rs
> index d62e9c1e2a89,408cd1154875..000000000000
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@@ -205,50 -98,7 +205,51 @@@ struct ModuleInfo 
>       description: Option<String>,
>       alias: Option<Vec<String>>,
>       firmware: Option<Vec<String>>,
> +     imports_ns: Option<Vec<String>>,
>  +    params: Option<Vec<Parameter>>,
>  +}
>  +
>  +#[derive(Debug)]
>  +struct Parameter {
>  +    name: String,
>  +    ptype: String,
>  +    default: String,
>  +    description: String,
>  +}
>  +
>  +fn expect_params(it: &mut token_stream::IntoIter) -> Vec<Parameter> {
>  +    let params = expect_group(it);
>  +    assert_eq!(params.delimiter(), Delimiter::Brace);
>  +    let mut it = params.stream().into_iter();
>  +    let mut parsed = Vec::new();
>  +
>  +    loop {
>  +        let param_name = match it.next() {
>  +            Some(TokenTree::Ident(ident)) => ident.to_string(),
>  +            Some(_) => panic!("Expected Ident or end"),
>  +            None => break,
>  +        };
>  +
>  +        assert_eq!(expect_punct(&mut it), ':');
>  +        let param_type = expect_ident(&mut it);
>  +        let group = expect_group(&mut it);
>  +        assert_eq!(group.delimiter(), Delimiter::Brace);
>  +        assert_eq!(expect_punct(&mut it), ',');
>  +
>  +        let mut param_it = group.stream().into_iter();
>  +        let param_default = expect_param_default(&mut param_it);
>  +        let param_description = expect_string_field(&mut param_it, "description");
>  +        expect_end(&mut param_it);
>  +
>  +        parsed.push(Parameter {
>  +            name: param_name,
>  +            ptype: param_type,
>  +            default: param_default,
>  +            description: param_description,
>  +        })
>  +    }
>  +
>  +    parsed
>   }
>   
>   impl ModuleInfo {
> @@@ -263,7 -113,7 +264,8 @@@
>               "license",
>               "alias",
>               "firmware",
> +             "imports_ns",
>  +            "params",
>           ];
>           const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
>           let mut seen_keys = Vec::new();
> @@@ -289,7 -139,7 +291,8 @@@
>                   "license" => info.license = expect_string_ascii(it),
>                   "alias" => info.alias = Some(expect_string_array(it)),
>                   "firmware" => info.firmware = Some(expect_string_array(it)),
> +                 "imports_ns" => info.imports_ns = Some(expect_string_array(it)),
>  +                "params" => info.params = Some(expect_params(it)),
>                   _ => panic!("Unknown key \"{key}\". Valid keys are: {EXPECTED_KEYS:?}."),
>               }
>   
> @@@ -329,25 -179,30 +332,30 @@@ pub(crate) fn module(ts: TokenStream) -
>       // Rust does not allow hyphens in identifiers, use underscore instead.
>       let ident = info.name.replace('-', "_");
>       let mut modinfo = ModInfoBuilder::new(ident.as_ref());
>  -    if let Some(authors) = info.authors {
>  +    if let Some(authors) = &info.authors {
>           for author in authors {
>  -            modinfo.emit("author", &author);
>  +            modinfo.emit("author", author);
>           }
>       }
>  -    if let Some(description) = info.description {
>  -        modinfo.emit("description", &description);
>  +    if let Some(description) = &info.description {
>  +        modinfo.emit("description", description);
>       }
>       modinfo.emit("license", &info.license);
>  -    if let Some(aliases) = info.alias {
>  +    if let Some(aliases) = &info.alias {
>           for alias in aliases {
>  -            modinfo.emit("alias", &alias);
>  +            modinfo.emit("alias", alias);
>           }
>       }
>  -    if let Some(firmware) = info.firmware {
>  +    if let Some(firmware) = &info.firmware {
>           for fw in firmware {
>  -            modinfo.emit("firmware", &fw);
>  +            modinfo.emit("firmware", fw);
>           }
>       }
>  -    if let Some(imports) = info.imports_ns {
> ++    if let Some(imports) = &info.imports_ns {
> +         for ns in imports {
> +             modinfo.emit("import_ns", &ns);
> +         }
> +     }
>   
>       // Built-in modules also export the `file` modinfo string.
>       let file =

The resolution looks good to me.

As I applied Michal's patch on top of Andreas changes, it looks like this on
my side:

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index d62e9c1e2a89..5bf0a487de50 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -206,6 +206,7 @@ struct ModuleInfo {
     alias: Option<Vec<String>>,
     firmware: Option<Vec<String>>,
     params: Option<Vec<Parameter>>,
+    imports_ns: Option<Vec<String>>,
 }

 #[derive(Debug)]
@@ -264,6 +265,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
             "alias",
             "firmware",
             "params",
+            "imports_ns",
         ];
         const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
         let mut seen_keys = Vec::new();
@@ -290,6 +292,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
                 "alias" => info.alias = Some(expect_string_array(it)),
                 "firmware" => info.firmware = Some(expect_string_array(it)),
                 "params" => info.params = Some(expect_params(it)),
+                "imports_ns" => info.imports_ns = Some(expect_string_array(it)),
                 _ => panic!("Unknown key \"{key}\". Valid keys are: {EXPECTED_KEYS:?}."),
             }

@@ -348,6 +351,11 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             modinfo.emit("firmware", fw);
         }
     }
+    if let Some(imports) = &info.imports_ns {
+        for ns in imports {
+            modinfo.emit("import_ns", &ns);
+        }
+    }

     // Built-in modules also export the `file` modinfo string.
     let file =

